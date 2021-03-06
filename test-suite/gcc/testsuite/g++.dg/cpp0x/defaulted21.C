// PR c++/46736
// { dg-options -std=c++0x }

struct U {
  U();
private:
  U(U const&);			// { dg-error "private" }
};

struct X {
  U const u;
  X();
  X(X&&);
};

X::X(X&&)=default;		// { dg-message "implicitly deleted" }
// { dg-prune-output "within this context" }

X f() {
  return X();
}
