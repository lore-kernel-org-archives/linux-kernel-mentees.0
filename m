Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748F614AD29
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  1 Mar 2025 22:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740867644; cv=none; b=U6KMy8hERjODpcAFLMSX8qPNWTWpCgmZ1qNx6Fo4mJ04E6lPs/N/aM70WGmiBYbxKifzi/itBQyWhZhKyIbBmY8R8JHUdtL2ljjMkJndQvpBEmiWVBzO/J67MAU+NY8SL3gv10apR6CGuFKe+H9ORYUpl5/Wos+2hY9o7VdV6SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740867644; c=relaxed/simple;
	bh=bWi5F8JskvMUXwDgg6TYargD0S/3onvbWna1Z9b1pt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LnQHvitFZPsXfFMUjp8gb47oksZ+CWFGJv/6C8Yl56zwPjoEIvGBc8EpwcjPZ8ELk4uSu/cewvIaK5hEJGV1uymtuXg4+3NGJATshdaRcz3gfnpXVAGKxAA3AnxRMUTO64zoFSZ9c0q9slzR7XqORQatLx94MeIsEm3G9KNq318=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3GjWXC2; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3GjWXC2"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-472039adb9bso42314811cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 01 Mar 2025 14:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740867641; x=1741472441; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w2JFrSTKfau8m6kxQWUnIa48KZ7ucuFBY64RIjU9F4I=;
        b=N3GjWXC2WxHDic+kji+aOgNIXeUTKNFetiCLP1+1ahI81B98O2WHB/CJ68CjolEi/N
         2i8prbHqJ8zs2HaLLgaPsni4S97rCWYi1OkMeGsb3xkIXcxF/J00iBdz/+mMBYnvs663
         Ac3hFpjkmxVvh+j85Kpb4cDt5WOANXDG424e49ZiFMI/59QJHX5b+1to5fD/GzJTfa8S
         topEZt3tu9Xolj312BvDeTPQX95u5B9EM3qVtcGmyPr4fuzswwTtDnlULA6mlFBdgov3
         MZ7BuS3o5MXVX14VA8St5Q9JRZxDNNrpeYbF1JK2Z5a/ubHiFUqqJPxf5Kdwsvj73nga
         V0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740867641; x=1741472441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2JFrSTKfau8m6kxQWUnIa48KZ7ucuFBY64RIjU9F4I=;
        b=X4w2MDzycIU/L+E1cAnYdF20pkAJh+C4WnVfdsref1ae3apOK4CLdxd+iFSWED+hJz
         a5CTexxeu4NMPPV9CSE0NRB8BmhYWEL8Hx0YgoEsIAEhiGkNx+gzUQLj/zZdreW2rr4q
         3cdvnHfqwAwF7R8krn3Q0kVC+DXNjzXKNslJaABjWQAjGLxwXUpCF1GcWsfcXF043av8
         L6BEnehVeJ/xPFPp7G+R0peMI19cTecBrzkyHIp0d1c6au+7oxz80f+MRzZbYKBhoNoo
         j9nvSEq0n2CprAH9Qn/zPZGXBLSFB9Y6ldASGdrm5QSb60842gY3eyvCurmuqX+a9Rly
         Nx2w==
X-Forwarded-Encrypted: i=1; AJvYcCWPhD+1TnNyGaaGYhjl4vn+grsZrTNSOyA/2ig7+v3h6Hk+Y18SoEfm3ElOUmQwfWurqgUg/XAZIgwmYHtYMixIduIAMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxHOBK2zPLS3QSnwoSaw4AznHXwSy9eKrm3NpAHX/GapHY1fuc
	ZpQdBHl20GlhklsTvq84KM4MrGX2+rE50zvXfB6qm+P4FqfxC0koxOFMIfLa
X-Gm-Gg: ASbGncs/ZzVnXjitZY4VQFucbGl5INZTNXoVCb/jn56sM2gncQ4hpd3CGGd1qQgdJbt
	/2kEJRdtSFEB9W2fBWtLfawukLgedrJYnO2lIQHZIdH1fet314loYOXrRzQ554nrr5JPOwbH2y1
	MhHlnsbqR2BkxoJEpuFDLKAqQtvMkp1f+xK52wjqkSqfpmZ6sTPQKnC32QQpOxiK6oDmaI9Xgng
	Gqcp4CIZ54pYBhxwQUPlJ6ftJMCkRdgCbtJxieapCtUHiyIgQbBK6R2xgUYtnuD2diPHUswD9aH
	8PJo1IakyU9eQdl8U74XjtXAqN66SGOXBwPhSbjkbzB7cA==
X-Google-Smtp-Source: AGHT+IGAPwp+ISQn26o9aqiS0lxaAntODE0R4hb1MMh8gugmxccnoljIhp8g8WWDVGlv0CoUEvB+aw==
X-Received: by 2002:a05:6214:226b:b0:6e6:668a:a27f with SMTP id 6a1803df08f44-6e8a0cfff83mr134583676d6.17.1740867641363;
        Sat, 01 Mar 2025 14:20:41 -0800 (PST)
Received: from iman-pc.home ([142.198.73.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976346fcsm36843696d6.14.2025.03.01.14.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 14:20:41 -0800 (PST)
From: Seyediman Seyedarab <imandevel@gmail.com>
X-Google-Original-From: Seyediman Seyedarab <ImanDevel@gmail.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Seyediman Seyedarab <ImanDevel@gmail.com>
Subject: [PATCH v2] kbuild: fix argument parsing in scripts/config
Date: Sat,  1 Mar 2025 17:21:37 -0500
Message-ID: <20250301222137.18617-1-ImanDevel@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script previously assumed --file was always the first argument,
which caused issues when it appeared later. This patch updates the
parsing logic to scan all arguments to find --file, sets the config
file correctly, and resets the argument list with the remaining
commands.

It also fixes --refresh to respect --file by passing KCONFIG_CONFIG=$FN
to make oldconfig.

Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
---
Changes in v2:
Specified the script name in the commit message.

 scripts/config | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/scripts/config b/scripts/config
index ff88e2faefd3..ea475c07de28 100755
--- a/scripts/config
+++ b/scripts/config
@@ -32,6 +32,7 @@ commands:
                              Disable option directly after other option
 	--module-after|-M beforeopt option
                              Turn option into module directly after other option
+	--refresh            Refresh the config using old settings
 
 	commands can be repeated multiple times
 
@@ -124,16 +125,22 @@ undef_var() {
 	txt_delete "^# $name is not set" "$FN"
 }
 
-if [ "$1" = "--file" ]; then
-	FN="$2"
-	if [ "$FN" = "" ] ; then
-		usage
+FN=.config
+CMDS=()
+while [[ $# -gt 0 ]]; do
+	if [ "$1" = "--file" ]; then
+		if [ "$2" = "" ]; then
+			usage
+		fi
+		FN="$2"
+		shift 2
+	else
+		CMDS+=("$1")
+		shift
 	fi
-	shift 2
-else
-	FN=.config
-fi
+done
 
+set -- "${CMDS[@]}"
 if [ "$1" = "" ] ; then
 	usage
 fi
@@ -217,9 +224,8 @@ while [ "$1" != "" ] ; do
 		set_var "${CONFIG_}$B" "${CONFIG_}$B=m" "${CONFIG_}$A"
 		;;
 
-	# undocumented because it ignores --file (fixme)
 	--refresh)
-		yes "" | make oldconfig
+		yes "" | make oldconfig KCONFIG_CONFIG=$FN
 		;;
 
 	*)
-- 
2.48.1

