from dependencies import Injector
from src.application.account_balance import AccountBalance
from src.application.account_auth import AccountAuth
from src.infrastructure.repos.account_repo import AccountRepo
from src.infrastructure.repos.account_repo_local import AccountRepoLocal
from src.infrastructure.repos.order_repo_local import OrderRepoLocal

ENV = "local"

class Container(Injector):
	account_auth = AccountAuth
	account_balance = AccountBalance
	account_repo = AccountRepo if ENV == "prod" else AccountRepoLocal
	repo_repo = OrderRepoLocal