close all;
clear;

% ntk test affinity + health
% load("\\wsl$\Ubuntu\home\ntk\ardupilot\logs\barofreezelogs\00000003.BIN-105307.mat")
% ntk test health only
% load("\\wsl$\Ubuntu\home\ntk\ardupilot\logs\barofreezelogs\00000003.BIN-105307.mat")
% ntk test affinity only
% load("\\wsl$\Ubuntu\home\ntk\ardupilot\logs\barofreezelogs\00000003.BIN-105307.mat")

% ekf plane switch affinity only, no health
% vars = {'AHR2', 'BARO_0', 'BARO_1', 'XKF0', 'XKFS_0', 'XKFS_0'};
% load('\\wsl$\Ubuntu\home\ntk\ardupilot\logs\00000003.BIN-391039.mat');

% ekf plane swittch affinity + health
% load('\\wsl$\Ubuntu\home\ntk\ardupilot\logs\00000003.BIN-394522.mat');

% load('\\wsl$\Ubuntu\home\ntk\buildlogs\ArduPlane-EpsilonBaroTest-00000003.BIN-75663.mat');

% epsilon test affinity only
% load("\\wsl$\Ubuntu\home\ntk\ardupilot\logs\00000003.BIN-epsilon_baro_test-affinity_and_health.mat")

% epsilon test no affinity
% load("\\wsl$\Ubuntu\home\ntk\ardupilot\logs\00000003.BIN-epsilon_baro_test-health_only.mat")
% load("\\wsl$\Ubuntu\home\ntk\ardupilot\logs\00000003.BIN-146019.mat")

%5/1
% load("\\wsl$\Ubuntu\home\ntk\ardupilot\logs\00000003.BIN-149368.mat")
load("\\wsl$\Ubuntu\home\ntk\ardupilot\logs\00000003.BIN-149074.mat")
% load("\\wsl$\Ubuntu\home\ntk\ardupilot\logs\00000003.BIN-149446.mat")

% glitch with affinity
% load("\\wsl$\Ubuntu\home\ntk\ardupilot\logs\00000003.BIN-149435.mat")

% glitch without affinity
% load("\\wsl$\Ubuntu\home\ntk\ardupilot\logs\00000003.BIN-147931.mat")

tiledlayout(6, 1, 'Padding', 'Compact', 'TileSpacing', 'Compact');
ax1 = nexttile([3 1]); hold on; grid on;
title("Epsilon Project Barometer Fault Injection");

% plot alt
% plot(AHR2(:,1), AHR2(:,6) - 585.09, "g-", "LineWidth", 2);
lgnd = {}; lgndIdx = 1;
plot(XKF5_0(:,2), XKF5_0(:,8), "g.-", "LineWidth", 1.5); %core 0 alt
lgnd{lgndIdx} = "core 0 alt"; lgndIdx = lgndIdx + 1;
if exist('XKF5_1')
    plot(XKF5_1(:,2), XKF5_1(:,8), "c.-", "LineWidth", 1.5); %core 1 alt
    lgnd{lgndIdx} = "core 1 alt"; lgndIdx = lgndIdx + 1;
end
% plot(GPS_0(:,1), GPS_0(:,11) - 585.09, "y-", "LineWidth", 2); %gps alt
% plot(GPS_1(:,1), GPS_1(:,11) - 585.09, "c-", "LineWidth", 2);
plot(BARO_0(:,2), BARO_0(:,4), "r-");
lgnd{lgndIdx} = "baro 0 alt"; lgndIdx = lgndIdx + 1;
plot(BARO_1(:,2), BARO_1(:,4), "m-");
lgnd{lgndIdx} = "baro 1 alt"; lgndIdx = lgndIdx + 1;
% plot(SIM(:,2), SIM(:,6) - 585.09, "k-");
% lgnd{lgndIdx} = "sim alt"; lgndIdx = lgndIdx + 1;
legend(lgnd);

%plot active EKF Core
ax2 = nexttile([1 1]); hold on; grid on;
% plot(BARO_0(:,1), BARO_0(:,11));
% plot(BARO_1(:,1), BARO_1(:,11));
plot(XKF4_0(:,2), XKF4_0(:,16), "k-");
legend("active core")

% plot which core is using each barometer
ax3 = nexttile([1 1]); hold on; grid on;
plot(XKFS_0(:,2), XKFS_0(:,5), "g.-", "LineWidth", 4);
plot(XKFS_1(:,2), XKFS_1(:,5), "b.-", "LineWidth", 2);
legend("core 0 baro", "core 1 baro");

% plot which core is using each barometer
ax4 = nexttile([1 1]); hold on; grid on;
plot(BARO_0(:,2), BARO_0(:,11), "g.-", "LineWidth", 4);
plot(BARO_1(:,2), BARO_1(:,11), "b.-", "LineWidth", 2);
legend("baro 0 health", "baro 1 health");

linkaxes([ax1 ax2 ax3 ax4],'x')
