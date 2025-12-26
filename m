Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D5F14AD20
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Dec 2025 05:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766728693; cv=none; b=dFE7aKakFEuNEuKLIasmqfEe0Nfp1G+2SoSxC94hTtOPZ3NuVBnlBj0B16IRyJbPoW5qRYwvM1SY5e2y0UGsIQGucWVQ8u9xqtdtVLKntPwauRKp33Yx9EuTRLERL63KH6+JtJv2BO1Pttf8wfbIZrvoxESpwLIUZcaNE0oKOZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766728693; c=relaxed/simple;
	bh=SWafGHchQ/WupSVFE44reC0oea2jmGzjOwOgHXp6duk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dbjnD3YCDGbPkE8nwomUiGlQr1WH2DfK0TL/J+cN/3ptmVPLjGKyofFkEvo9WqFieV1p44Tp+Ecw96YWh8sbxhq0mk+Bh23stemxxW5eAkFUTsWzFfWZdv+Jb1JlOdEE44f8bQ5QUC4KZT4p74pMKWZjneYFziUUAp9K1hmOF94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ogbou9Y5; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ogbou9Y5"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7c75178c05fso2382218a34.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Dec 2025 21:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766728691; x=1767333491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEDLwh/JQNESRj4Jh747I4xTT7R/UMI4uSVnVsPwLP8=;
        b=Ogbou9Y5YiWP0hVKv2zSELK0ZirLaSsZfUbgx24cgP0vrq+h4VoTpqhMC+MZATF0Bb
         jJaARVk7oL0U7VTBEkHz501Y5njQZyvFe9sqGQVmOPi/A9p8A0b+XvsC4Xby+s9ZkoSU
         8DqaJGaMhHI3Djo4/Qa1CmK5soVH3V86H6aCNmoaMuiiuPhauD+G9M1UeBqXftY6+L/T
         5NtnU1aXLJIWmnD0ccxS5uuylj1h9xl6/sSjc6B6EVTB8gdvi1CgiShDrOO51WgZm7HK
         t9CTsHHyz+PVUC8ZFEbpTHafF9n8jqO4Y4KpGdCKRNHMmJGvXcWoURzlKhkg34fQ2F1r
         RcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766728691; x=1767333491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GEDLwh/JQNESRj4Jh747I4xTT7R/UMI4uSVnVsPwLP8=;
        b=TC3hSVhTlrRR9MHbgpQ0ThRyK8kpBJ2DWn0WRf31V91bnk2QgXDQSIyJZbzMgO+rB1
         VQ+zCLF0xgVL+sgHITfvuRPPjXjobc5dV5439s1T214P25aVM2fNL2ZRF5r8vpCk8zVI
         h3hbzR0JjzerJ5+fgoVFATAu4NnluooZw151L6I5fOkp1SIPbD/EnzVv22Wcua9wPk4E
         Hk5CA7ueHtTDTwWDgilx2FUnPXMyeRsrbAifWxyDzV0DbWQEQXhPcMz3GkjUP65Y5+7I
         n9hNsq1SDll8xWNcNuxmSUnOquqFgQv1luylnTVfvkLHxuhdLLHMZCa0OXrpG1Zs0dRm
         pa5g==
X-Forwarded-Encrypted: i=1; AJvYcCUJ0VEaOZZFX58+cSpBrSvbLWeK8D+Tp0f86UNLlpF0puTOUMI6cDbjB/XAlOOgVmScVz34yLVBjkmoV/xrQWvPRQEVAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/zT13D8FnH8XnVtnOMIbmRerY8bku2+kFHJg+givf29cxjDxH
	8hsulKzqBs/iceMnARf/8CFpkQyjxbkWMs18cZSflb7TqbKWzEVFi5vi
X-Gm-Gg: AY/fxX6EKPoMuKZ8+xdSidyJH7vzDt2bw2kXijGVuCJXTwoVf1P9+UsPsk+UTa+pCeU
	wW7kzG3yk1lHFESkquHlNJySoVxezy+a2D088VF1KvnJC1ic29Nf9Z9vJIFKffaxyz6SRten/hs
	0DvhFszXSmqVvtVdkrUmjiSqyrzMvCU7DuLVieudbNzTqySD62zTIdvb09C+eQd1s8fo1LFjiha
	sf5G7emQIokRCMm0gjCKXZsrwugehWC1Rwaapqt4POO61WczBAAo39WDgSQ4EbeEyQXm2paVVCK
	eTYQrz4blJlHJnb0BOrhFFLCIgoIcWCN9YLtRPw2bsH1MfQaInPHHtkwqyPHXZiC/V4Dk9aOmZ8
	0j9ihsyu44k5krMxfruRJHiXUvwMkJ1RdI5PDycpJI1TCH3KwS4fxvYXcrlHhrNQnc0FgHrOTdV
	j4F+1da0y3gg9bmtvTg0liU4jRSndfWQwYy1DPWzxvFj822Dy2ECkgeXPiTUg=
X-Google-Smtp-Source: AGHT+IEBxDfwWRrZ1vDRbVLUN+XMFV3KU+eNVhr6y4k9b09yPfFabGcvaVkj8qpo0djiX4KdJQ2C9Q==
X-Received: by 2002:a05:6830:dc6:b0:7c7:1c77:f107 with SMTP id 46e09a7af769-7cc66a9e05dmr11412583a34.34.1766728690767;
        Thu, 25 Dec 2025 21:58:10 -0800 (PST)
Received: from nairdora (108-75-189-46.lightspeed.wchtks.sbcglobal.net. [108.75.189.46])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc66645494sm14532416a34.0.2025.12.25.21.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 21:58:10 -0800 (PST)
From: Adrian Yip <adrian.ytw@gmail.com>
To: stable@vger.kernel.org
Cc: Adrian Moreno <amorenoz@redhat.com>,
	Pravin B Shelar <pshelar@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Aaron Conole <aconole@redhat.com>,
	Adrian Yip <adrian.ytw@gmail.com>
Subject: [PATCH 6.6.y 1/2] selftests: openvswitch: Fix escape chars in regexp.
Date: Thu, 25 Dec 2025 23:56:04 -0600
Message-ID: <20251226055610.3120437-2-adrian.ytw@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251226055610.3120437-1-adrian.ytw@gmail.com>
References: <20251226055610.3120437-1-adrian.ytw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adrian Moreno <amorenoz@redhat.com>

[ Upstream commit 3fde60afe1f84746c1177861bd27b3ebb00cb8f5 ]

Character sequences starting with `\` are interpreted by python as
escaped Unicode characters. However, they have other meaning in
regular expressions (e.g: "\d").

It seems Python >= 3.12 starts emitting a SyntaxWarning when these
escaped sequences are not recognized as valid Unicode characters.

An example of these warnings:

tools/testing/selftests/net/openvswitch/ovs-dpctl.py:505:
SyntaxWarning: invalid escape sequence '\d'

Fix all the warnings by flagging literals as raw strings.

Signed-off-by: Adrian Moreno <amorenoz@redhat.com>
Reviewed-by: Aaron Conole <aconole@redhat.com>
Link: https://lore.kernel.org/r/20240416090913.2028475-1-amorenoz@redhat.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
(cherry picked from commit 3fde60afe1f84746c1177861bd27b3ebb00cb8f5)
Signed-off-by: Adrian Yip <adrian.ytw@gmail.com>
---
 .../selftests/net/openvswitch/ovs-dpctl.py       | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 8b120718768e..9f8dec2f6539 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -489,7 +489,7 @@ class ovsactions(nla):
                     actstr, reason = parse_extract_field(
                         actstr,
                         "drop(",
-                        "([0-9]+)",
+                        r"([0-9]+)",
                         lambda x: int(x, 0),
                         False,
                         None,
@@ -502,9 +502,9 @@ class ovsactions(nla):
                     actstr = actstr[len("drop"): ]
                     return (totallen - len(actstr))
 
-            elif parse_starts_block(actstr, "^(\d+)", False, True):
+            elif parse_starts_block(actstr, r"^(\d+)", False, True):
                 actstr, output = parse_extract_field(
-                    actstr, None, "(\d+)", lambda x: int(x), False, "0"
+                    actstr, None, r"(\d+)", lambda x: int(x), False, "0"
                 )
                 self["attrs"].append(["OVS_ACTION_ATTR_OUTPUT", output])
                 parsed = True
@@ -512,7 +512,7 @@ class ovsactions(nla):
                 actstr, recircid = parse_extract_field(
                     actstr,
                     "recirc(",
-                    "([0-9a-fA-Fx]+)",
+                    r"([0-9a-fA-Fx]+)",
                     lambda x: int(x, 0),
                     False,
                     0,
@@ -588,17 +588,17 @@ class ovsactions(nla):
                                 actstr = actstr[3:]
 
                             actstr, ip_block_min = parse_extract_field(
-                                actstr, "=", "([0-9a-fA-F\.]+)", str, False
+                                actstr, "=", r"([0-9a-fA-F\.]+)", str, False
                             )
                             actstr, ip_block_max = parse_extract_field(
-                                actstr, "-", "([0-9a-fA-F\.]+)", str, False
+                                actstr, "-", r"([0-9a-fA-F\.]+)", str, False
                             )
 
                             actstr, proto_min = parse_extract_field(
-                                actstr, ":", "(\d+)", int, False
+                                actstr, ":", r"(\d+)", int, False
                             )
                             actstr, proto_max = parse_extract_field(
-                                actstr, "-", "(\d+)", int, False
+                                actstr, "-", r"(\d+)", int, False
                             )
 
                             if t is not None:
-- 
2.52.0

