// DO NOT CHANGE: Configuration for git commit message wizard
const process = require('node:process');

const breaklineConfig = {
    breaklineChar: '|',
    breaklineNumber: 100,
};

function defaultWithBreaks(name, breaklineChar = breaklineConfig.breaklineChar) {
    return (process.env[name] || '')
        .replaceAll('\n', breaklineChar)
        .replaceAll('\r\n', breaklineChar);
}

const types = [
    {value: 'fix', name: 'fix:      A bug fix'},
    {value: 'feat', name: 'feat:     A new feature'},
    {value: 'test', name: 'test:     Adding missing tests or correcting existing tests'},
    {value: 'chore', name: "chore:    Other changes that don't modify src or test files"},
    {value: 'style', name: 'style:    Changes that do not affect the meaning of the code'},
    {value: 'docs', name: 'docs:     Documentation only changes'},
    {value: 'ci', name: 'ci:       Changes to our CI configuration files and scripts'},
    {value: 'build', name: 'build:    Changes that affect the build system or external dependencies'},
    {value: 'refactor', name: 'refactor: A code change that neither fixes a bug nor adds a feature'},
    {value: 'perf', name: 'perf:     A code change that improves performance'},
    {value: 'revert', name: 'revert:   Reverts a previous commit'}
];
const defaultType = defaultWithBreaks('DEFAULT_TYPE');

const scopes = [];
const defaultScope = defaultWithBreaks('DEFAULT_SCOPE');
if (defaultScope) {
    scopes.push(defaultScope);
}

/** @type {import('cz-git').CommitizenGitOptions} */
module.exports = {
    ...breaklineConfig,

    skipQuestions: [
        'footer',
        'footerPrefix',
        'confirmCommit',
    ],

    messages: {
        type: "Select the type of change that you're committing:",
        scope: 'JIRA ID (optional):',
        customScope: 'Enter JIRA ID:',
        subject: 'Write a SHORT, IMPERATIVE tense description of the change:\n',
        body: 'Provide a LONGER description of the change (optional). Use "|" to break new line:\n',
        breaking: 'List any BREAKING CHANGES (optional). Use "|" to break new line:\n',
    },

    types,
    defaultType,
    allowBreakingChanges: ['feat', 'fix'],
    markBreakingChangeMode: false,

    scopes,
    defaultScope,
    allowEmptyScopes: true,
    emptyScopesAlias: 'none',
    allowCustomScopes: true,
    customScopesAlias: 'other',
    scopeOverrides: undefined,

    defaultSubject: defaultWithBreaks('DEFAULT_SUBJECT'),
    upperCaseSubject: false,

    defaultBody: defaultWithBreaks('DEFAULT_BODY'),

    defaultIssues: '',
    issuePrefixes: [],
    allowCustomIssuePrefix: false,
    allowEmptyIssuePrefix: false,

    confirmColorize: true,
    themeColorCode: '',

    useEmoji: false,
    useAI: false,
};