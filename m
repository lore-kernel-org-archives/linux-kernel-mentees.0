Received: from 4.mo576.mail-out.ovh.net (4.mo576.mail-out.ovh.net [46.105.42.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B6C651
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Nov 2023 12:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.1.93])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 1F4F22FE83
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Nov 2023 08:29:20 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-btv5j (unknown [10.110.115.220])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 6EF6D1FDDC;
	Tue,  7 Nov 2023 08:29:18 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.105])
	by ghost-submission-6684bf9d7b-btv5j with ESMTPSA
	id I8daFV71SWUqAQAAWJgi0A
	(envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 07 Nov 2023 08:29:18 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-105G0063a9f607e-0194-493b-a956-73c3cacca2fa,
                    990ED9DB402E285008FC912DE57946D84A8BC800) smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp:213.216.211.70
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: evan.quan@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	skhan@linuxfoundation.org
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
	airlied@gmail.com,
	daniel@ffwll.ch,
	jdelvare@suse.com,
	linux@roeck-us.net,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drm/amd/pm: clean up redundant comparisons with 0
Date: Tue,  7 Nov 2023 10:29:09 +0200
Message-Id: <20231107082910.92508-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17681132139527513793
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudduhedguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepfedtleeuteeitedvtedtteeuieevudejfeffvdetfeekleehhfelleefteetjeejnecukfhppeduvdejrddtrddtrddupddvudefrddvudeirddvuddurdejtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugidruggvvhdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht

There is a couple of function return checks of functions that return
unsigned values, and local variables to hold them are also unsigned, so
checking if they are negative will always return false. This patch will
remove them, as well as the never reached code.

drivers/gpu/drm/amd/pm/amdgpu_pm.c:2801:5-8: WARNING: Unsigned expression compared with zero: val < 0
drivers/gpu/drm/amd/pm/amdgpu_pm.c:2814:5-8: WARNING: Unsigned expression compared with zero: val < 0

Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 8bb2da13826f..e7bb1d324084 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -2798,8 +2798,6 @@ static ssize_t amdgpu_hwmon_show_power_avg(struct device *dev,
 	unsigned int val;
 
 	val = amdgpu_hwmon_get_power(dev, AMDGPU_PP_SENSOR_GPU_AVG_POWER);
-	if (val < 0)
-		return val;
 
 	return sysfs_emit(buf, "%u\n", val);
 }
@@ -2811,8 +2809,6 @@ static ssize_t amdgpu_hwmon_show_power_input(struct device *dev,
 	unsigned int val;
 
 	val = amdgpu_hwmon_get_power(dev, AMDGPU_PP_SENSOR_GPU_INPUT_POWER);
-	if (val < 0)
-		return val;
 
 	return sysfs_emit(buf, "%u\n", val);
 }
-- 
2.39.2

