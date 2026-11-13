<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🍕</text></svg>" type="image/svg+xml">
    <title>Delivery-Tech | Painel de Controle e Gestão de Pedidos</title>
    <!-- Tailwind CSS para estilização moderna -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- FontAwesome para ícones -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-slate-50 text-slate-800 font-sans antialiased min-h-screen flex flex-col justify-between">

    <!-- Cabeçalho -->
    <header class="bg-slate-900 text-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 py-4 flex flex-col md:flex-row justify-between items-center">
            <div class="flex items-center space-x-3 mb-2 md:mb-0">
                <div class="bg-orange-500 p-2 rounded-lg text-white font-bold text-xl shadow">
                    <i class="fa-solid fa-utensils"></i>
                </div>
                <div>
                    <h1 class="text-2xl font-bold tracking-tight">Delivery-tech API</h1>
                    <p class="text-xs text-slate-400">Gestão Inteligente de Pedidos • Spring Boot 3.2</p>
                </div>
            </div>
            <div class="flex items-center space-x-3 text-sm">
                <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-emerald-100 text-emerald-800">
                    <span class="w-2 h-2 mr-1.5 bg-emerald-500 rounded-full animate-pulse"></span> Sistema Ativo
                </span>
                <a href="http://localhost:8080/h2-console" target="_blank" class="bg-slate-800 hover:bg-slate-700 text-slate-200 px-3 py-1.5 rounded-lg border border-slate-700 transition">
                    <i class="fa-solid fa-database mr-1"></i> Console H2
                </a>
            </div>
        </div>
    </header>

    <!-- Conteúdo Principal -->
    <main class="max-w-7xl mx-auto px-4 py-8 w-full grid grid-cols-1 lg:grid-cols-3 gap-8">

        <!-- Coluna Esquerda: Formulário de Cadastro -->
        <section class="bg-white rounded-xl shadow-sm border border-slate-200 p-6 lg:col-span-1 h-fit">
            <h2 class="text-lg font-bold text-slate-900 mb-4 flex items-center">
                <i class="fa-solid fa-cart-plus text-orange-500 mr-2"></i> Novo Pedido
            </h2>
            <form id="pedidoForm" class="space-y-4">
                <div>
                    <label class="block text-sm font-medium text-slate-700 mb-1">Identificador / Cliente</label>
                    <input type="text" id="identificador" required placeholder="Ex: Cliente João Silva" 
                        class="w-full px-3 py-2 border border-slate-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500 text-sm">
                </div>
                <div>
                    <label class="block text-sm font-medium text-slate-700 mb-1">Descrição do Pedido</label>
                    <textarea id="descricao" rows="3" required placeholder="Ex: 2x Pizza Margherita + Refri 2L" 
                        class="w-full px-3 py-2 border border-slate-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500 text-sm"></textarea>
                </div>
                <div>
                    <label class="block text-sm font-medium text-slate-700 mb-1">Valor Total (R$)</label>
                    <input type="number" step="0.01" id="valorTotal" required placeholder="0.00" 
                        class="w-full px-3 py-2 border border-slate-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500 text-sm">
                </div>
                <button type="submit" 
                    class="w-full bg-orange-500 hover:bg-orange-600 text-white font-medium py-2.5 rounded-lg transition shadow-sm flex items-center justify-center">
                    <i class="fa-solid fa-paper-plane mr-2"></i> Enviar Pedido (POST)
                </button>
            </form>
            <div id="formFeedback" class="mt-4 text-xs font-medium hidden p-3 rounded-lg"></div>
        </section>

        <!-- Coluna Direita: Listagem e Monitoramento -->
        <section class="bg-white rounded-xl shadow-sm border border-slate-200 p-6 lg:col-span-2 flex flex-col justify-between">
            <div>
                <div class="flex justify-between items-center mb-6">
                    <h2 class="text-lg font-bold text-slate-900 flex items-center">
                        <i class="fa-solid fa-list-check text-orange-500 mr-2"></i> Pedidos Registrados no Banco
                    </h2>
                    <button onclick="carregarPedidos()" class="text-sm bg-slate-100 hover:bg-slate-200 text-slate-700 px-3 py-1.5 rounded-lg transition flex items-center">
                        <i class="fa-solid fa-rotate mr-1.5"></i> Atualizar Lista
                    </button>
                </div>

                <!-- Tabela de Pedidos -->
                <div class="overflow-x-auto border border-slate-200 rounded-lg">
                    <table class="w-full text-left border-collapse">
                        <thead>
                            <tr class="bg-slate-100 text-slate-600 text-xs uppercase tracking-wider">
                                <th class="p-3">ID</th>
                                <th class="p-3">Cliente / Identificador</th>
                                <th class="p-3">Descrição</th>
                                <th class="p-3">Valor</th>
                                <th class="p-3">Status</th>
                            </tr>
                        </thead>
                        <tbody id="tabelaPedidos" class="divide-y divide-slate-200 text-sm text-slate-700">
                            <tr>
                                <td colspan="5" class="p-4 text-center text-slate-400">Carregando pedidos da API...</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Links Rápidos de Documentação / Endpoints -->
            <div class="mt-8 pt-4 border-t border-slate-100 grid grid-cols-1 sm:grid-cols-3 gap-4 text-xs">
                <a href="http://localhost:8080/api/pedidos" target="_blank" class="p-3 bg-slate-50 hover:bg-slate-100 rounded-lg border border-slate-200 text-center transition block">
                    <i class="fa-solid fa-code text-orange-500 block text-base mb-1"></i>
                    <span class="font-semibold text-slate-800">Endpoint GET /api/pedidos</span>
                </a>
                <a href="http://localhost:8080/actuator/health" target="_blank" class="p-3 bg-slate-50 hover:bg-slate-100 rounded-lg border border-slate-200 text-center transition block">
                    <i class="fa-solid fa-heart-pulse text-emerald-500 block text-base mb-1"></i>
                    <span class="font-semibold text-slate-800">Actuator Health Check</span>
                </a>
                <a href="http://localhost:8080/" target="_blank" class="p-3 bg-slate-50 hover:bg-slate-100 rounded-lg border border-slate-200 text-center transition block">
                    <i class="fa-solid fa-house text-blue-500 block text-base mb-1"></i>
                    <span class="font-semibold text-slate-800">Home da Aplicação</span>
                </a>
            </div>
        </section>

    </main>

    <!-- Rodapé -->
    <footer class="bg-white border-t border-slate-200 py-4 text-center text-xs text-slate-500">
        <p>Delivery-tech • Gestão de Projetos de TI (Qualifica São Paulo / Fundação FAT — Turma T9) • Gerente: Fabiano Rocha</p>
    </footer>

    <!-- Script de Integração com a API Spring Boot -->
    <script>
        const API_URL = 'http://localhost:8080/api/pedidos';

        async function carregarPedidos() {
            const tbody = document.getElementById('tabelaPedidos');
            try {
                const response = await fetch(API_URL);
                if (!response.ok) throw new Error('Erro ao conectar com a API');
                const pedidos = await response.json();

                if (pedidos.length === 0) {
                    tbody.innerHTML = `<tr><td colspan="5" class="p-4 text-center text-slate-400">Nenhum pedido cadastrado ainda.</td></tr>`;
                    return;
                }

                tbody.innerHTML = pedidos.map(p => `
                    <tr class="hover:bg-slate-50">
                        <td class="p-3 font-mono text-xs">#${p.id}</td>
                        <td class="p-3 font-medium text-slate-900">${p.identificador || '-'}</td>
                        <td class="p-3">${p.descricao || '-'}</td>
                        <td class="p-3 font-semibold text-emerald-600">R$ ${Number(p.valorTotal || 0).toFixed(2)}</td>
                        <td class="p-3"><span class="px-2 py-1 text-xs font-semibold rounded-full bg-blue-100 text-blue-800">${p.status || 'CRIADO'}</span></td>
                    </tr>
                `).join('');
            } catch (error) {
                tbody.innerHTML = `<tr><td colspan="5" class="p-4 text-center text-red-500">Falha ao carregar API. Verifique se o Spring Boot está rodando na porta 8080.</td></tr>`;
            }
        }

        document.getElementById('pedidoForm').addEventListener('submit', async function(e) {
            e.preventDefault();
            const feedback = document.getElementById('formFeedback');

            const novoPedido = {
                identificador: document.getElementById('identificador').value,
                descricao: document.getElementById('descricao').value,
                valorTotal: parseFloat(document.getElementById('valorTotal').value)
            };

            try {
                const response = await fetch(API_URL, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(novoPedido)
                });

                if (response.ok) {
                    feedback.className = "mt-4 text-xs font-medium bg-emerald-50 text-emerald-700 border border-emerald-200 p-3 rounded-lg block";
                    feedback.textContent = "Pedido cadastrado com sucesso!";
                    document.getElementById('pedidoForm').reset();
                    carregarPedidos();
                } else {
                    throw new Error('Erro ao salvar pedido');
                }
            } catch (error) {
                feedback.className = "mt-4 text-xs font-medium bg-red-50 text-red-700 border border-red-200 p-3 rounded-lg block";
                feedback.textContent = "Erro ao enviar pedido para o backend.";
            }
        });

        // Carrega os pedidos ao abrir a página
        carregarPedidos();
    </script>
</body>
</html>