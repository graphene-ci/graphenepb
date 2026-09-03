# graphenepb

Неактивный отдельный protobuf-модуль: текущие компоненты Graphene его не
импортируют.

Действующие контракты принадлежат поставляемому компоненту:

- соединение агента — `agent/proto/agent` в репозитории `agent`;
- публичный Management API — `graphene/proto/management` в репозитории
  `graphene`;
- контракты pipeline worker plane — `pipeline/proto` в репозитории
  `pipeline`.

Этот checkout сохраняется для анализа прежнего контракта, но изменения здесь не
меняют текущий продукт. Пользовательская документация находится в
<https://graphene-ci.github.io/docs/>.
