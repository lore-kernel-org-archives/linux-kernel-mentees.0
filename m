Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1F88BF8
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  1 Mar 2025 22:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740866768; cv=none; b=Pc0vB4iz/9zCLSLurLVURdH62E1zpVP6VjMkWNcZ0eHO+q+O4EnnS1ewguaCspW+uiAR9fVDdHEfTiO3dl48dn98kT/Ht3lylTNG7CFDExJYEghAYVR4hMOV2Vvi7rFsNvkOg8f+vQGvoum1dJgXs8avr/lu3iIYayvr/Xpfbco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740866768; c=relaxed/simple;
	bh=k0IF4TI1s27h+CuL7qGATdK6mdl2VzdYKRR18nSNV4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Safk/JyVx+zBERx+h3xByTWv8Yy48LEsLAw424b+1lGE44wdDvvpYI9G30f/EcxpuF7wbMjIFcx37Ow0pcz9cP6IsX4XkNYeuV0LNAQoG3tAuWP4Due6nqouo8wZQ1OOvUmLwN9BSR66+Vf7ZJm+iJpuz0+cIZQU/xTt6Gze0yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxU2YQnx; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxU2YQnx"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e895f3365aso26183826d6.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 01 Mar 2025 14:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740866765; x=1741471565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kgbfyzwgi4YaDDp7Z2cDbzPB9by/mlp/Ew++4xg1OP4=;
        b=DxU2YQnxsyuZ1mfbxeCb+JqsXtBLFmqHbFteakhrCRdHYQVJk4kcb8NXyMMGmJuwrl
         xDjnOv6RkShy9+bdteyYl9JJlDOKLbgkcneadFHzuQJU4B/qa9NV8McG8O18hI0lNvik
         5JU6/IfeHyfTlTUjOKsA7FK6eswyhkzRSHuAeyYwlK8NkgBlxsOq3XJADSEsPAiZLCCg
         dt6cvc5d2ZjAr6iUFK3saY427S8PhLUpJbwAZrvzqCcWUyvr1dQkrH3drDvxS7hwsFuE
         eeu8WpzoGK9wQyIEU8gKTtj3D8K49YRYnUDzgnwDooAz/ohFfITsMm2ITHHtmMF7/aXc
         xCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740866765; x=1741471565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kgbfyzwgi4YaDDp7Z2cDbzPB9by/mlp/Ew++4xg1OP4=;
        b=lf7VV+rvwLW0IiJMlGEjRjQScuobmGl0PKSZfQCqOZwYfhckqAEOmMsnI07CtDGEiH
         eYu4gSnulV7TN8tcNFdTQEWxXdGUVWHl2wT88KgvNBO7CYm/jSqQiAx+NrDhmOuzvnyY
         EMlMMUMd1pPg1InzfFNdYrwgyIcr/QgJild0U2PcXSP6kOYenQFFel0tBg5rIg+JVXtp
         1KZ79AbRqGffDnj+vkGZgSc/3hkThtePLrJvnxTunsu2uQDFhtNu5PMSK0ieA75Lr7qi
         NNT2H8tZ48cM3kHxCKdmx/PYTom/gpAojKuWKkxY2WK7D7T2Stwr5GZrzTyAwThIPIOL
         xfPg==
X-Forwarded-Encrypted: i=1; AJvYcCU3rD/t8Bvn9g0m6cTC1gcoyvBz02csZK4OIormdvi00Ox/ktZyk/Ii4RA3o8zdxyMeQcMlAankqWTV0cyE1q0RP6nPgA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYpmmpRS1dtMzyxUYxxd8a1SkdH1np9JqHVVezKGtUNQCOendp
	TlYss3uvqTxh7XIsDcSygdmqUPiq52u7rau3VFgE70a6ipjZ677oKIgEGPG/
X-Gm-Gg: ASbGncuN25QE+eOmlSp2sXdwT8D3QzTwsVLOIsa4CSGaoQwWOplZ8xCswHjjobKp5DJ
	yaBtESY2KL9IummMqN7k95LDyOfbG8N4ZTg2iNEvumk44hxjVtnHo7rzFXtFPDe9Q33sB0Bl2YD
	fEqxFYvq7r57jcbBkMBQBfSBpr77nk63zPbXJi/ktlEXs6yflKk70SD4fLDmm91F/4/IDAIM+kR
	g1BhMM/RAEKShOxWrs/sri8eI6NSdaaKzKXPc14KZi0oFScN2bKz47LgWhBJhy5XnIEAana29Br
	FFb0Ke3tWq5VOBy/7ig7WgbZoj53Jdwva5Lw1p48WcqQfQ==
X-Google-Smtp-Source: AGHT+IERib8erINFgErq49CXeKJmSuKuQ7NCMtX/7SMSnrTvjs7UzYWAhGUNb1ifruF+bJ9bv1JRDQ==
X-Received: by 2002:a05:6214:2aad:b0:6e8:9feb:76e6 with SMTP id 6a1803df08f44-6e8a0d2c8f1mr140249656d6.16.1740866765463;
        Sat, 01 Mar 2025 14:06:05 -0800 (PST)
Received: from iman-pc.home ([142.198.73.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976ec158sm36549756d6.119.2025.03.01.14.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 14:06:05 -0800 (PST)
From: Seyediman Seyedarab <imandevel@gmail.com>
X-Google-Original-From: Seyediman Seyedarab <ImanDevel@gmail.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Seyediman Seyedarab <ImanDevel@gmail.com>
Subject: [PATCH] kbuild: fix argument parsing to properly handle --file
Date: Sat,  1 Mar 2025 17:07:02 -0500
Message-ID: <20250301220702.16055-1-ImanDevel@gmail.com>
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

