Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847EE286D7C
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Jul 2025 19:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753557324; cv=none; b=ZnoltSwdhSOgRyRC1DhTE+vEhCSIqrOLa411jyS4JbYkYKZ7sk8xGBMkPjeOAaJb30dBvtim6gOEZyW/j7cQ08WPs08u8FMBDDofjMT0jE6r+tQdVMXR+emzG2swFn7hgpIXEoWvZ0bj1wDPRvfgo3Yak5xPvthqb8OqcvMgg2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753557324; c=relaxed/simple;
	bh=rbPylg62vbOjdHXx4PRqrOONXmlsrvEE8LVr3InFSKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j1624PEqlBvxmRG7KeS4e//XwVDMaLXHAQgxxCYZfgtaN4Kax5iaRwNpdPV4IcQ/zm3MZNnxPInMYfr3p00SW8auLTJp5ttCIUKAVJmmpGoA0M8HXLlWbQmcCX7HPHLIKm/IzHqg58759++TIYl4bJu85UnY4NcXnT28Qh853SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrFMzfsA; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrFMzfsA"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74b54cead6cso2113696b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Jul 2025 12:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753557323; x=1754162123; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lpcPUVrSqgoVbWvUEYVCKv6jr6R7p+WrNPGPv/zX2xc=;
        b=UrFMzfsA4tpoLmGyoqeeNIZOuNs1C82IYX2Ab/tZLdrz0VX1Z2Au/Y3ofAmnrvIysO
         Ah2x8QGajobeg6uBdCT3ipr+EZf4Ght4Nof9Fzbywt0Dgdy2PNfzJzfXE+xi0IXsqRyz
         N9CAgaqKCf9Zx2dY7gpuTbu4HIoNMp/HgZFMJhDvvgPJdD2rFvCeNE32tVfSp5+ywfWY
         5dO2O7vKLa/Zq9SmBW2WWgFEZLTNZHH5lEASxlDOwhjGXgEluUPQwaEXOjHKORBdGIJb
         cLJ9vRHnAfvPZwfv6Y2MqMQA7Knb9lSoqQ4mJJCrwHlS8wrqQD7sLq3sIrzCIcXUOCEy
         K2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753557323; x=1754162123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpcPUVrSqgoVbWvUEYVCKv6jr6R7p+WrNPGPv/zX2xc=;
        b=GqwSqVkdO2j6Lw2EhCn18Y9iAreXyxXPBLlQbrSbmLbbiVCaUZ15L11RM+WCxad8od
         mbMXoCooc6W5OrUZFV1SfEze+VET7T1CIjSEguvPXbVSyeqAwPv096xI4eqxCOoAovS/
         uZeQUafX8WFkmu4fJ7V9weRMhoeC4n2+kVRd0p3vHzNlb64hGiEFx/n5cBaRI6EAk4ZE
         x+auv3BrsVObo7mj/Hqos6Et2S8ucI98kIrux3GRYTO0j61XwMz39JDn5MSt1rOuI435
         4BA6qBTWGST+Va6YNB8pyZkENLRR9gA1IbIR9BCyx6ib8eGkUCHb3J561AffiTRWbWiL
         Ozxw==
X-Forwarded-Encrypted: i=1; AJvYcCVoRPJtjGG2Yj0TwM/Rf4zCvQmiCa0CKNiLgyxRAFoWs2XUUoYII49mbsl9o5IfbrMetu2VCMjHTMYBKQWEiXdL78vn2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAOpuWwRujaUU3ndf1tfD0xwtbCvCNXDXwJzVfOMbiekJ+XUjh
	ov/xJY3uNWaRxPKd2wE2Bkwr+xgpaQMgKZBcfs/QzG9GsBLQ2NUzbCBo
X-Gm-Gg: ASbGncsU9sUA5uAstPd1GxCe1iTVhQ6qmhDIRHH3CW83hU/sXvQBG0lnv5pxporForm
	bhK6nPUnGUIJAX1IfJFSQKOchn3dgqdiH4O8NMYSSy7CZE8TqDs/CQzgJS7S+45d56EmY/WAcbO
	LdwSoapYCuil/DndMevp68++ptAMI5cEsb3ty0Og88gKtEeJ9rrr8FB1izs4OHbsRu+H3kCn2f6
	B2wfOsridz6iLTPyn6hWq2HIYad65+N0sBgO2mNMBh27lDTKwuc4WyoQg9d8J8kTdTlpXF3IrbI
	tpL3vnI2t644xqStgzoVfzLqNeYEiNnLhK+6TdzEgfSA1zLonHcqeSdddepEXqK4Kb3Fwo236MB
	YYhAdNnNN+vjxCKa3NuCLze0Rbl/ezg==
X-Google-Smtp-Source: AGHT+IHGi72nheJIolzGFekC7V4ue+UFJk6zZYD+HfImkmP0eeJAEQyRuUOJUTy5Olyzc4lrcAy1xg==
X-Received: by 2002:a05:6a00:4614:b0:74e:c917:3b1a with SMTP id d2e1a72fcca58-763385c9e1fmr9669640b3a.24.1753557322618;
        Sat, 26 Jul 2025 12:15:22 -0700 (PDT)
Received: from archlinux ([205.254.163.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408c02706sm2202726b3a.39.2025.07.26.12.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 12:15:22 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: masahiroy@kernel.org,
	nicolas.schier@linux.dev,
	linux-kbuild@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] kconfig: replace strcpy() with strlcpy() in symbol.c
Date: Sun, 27 Jul 2025 00:45:15 +0530
Message-ID: <20250726191515.171012-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strcpy() performs no bounds checking and can lead to buffer overflows if
the input string exceeds the destination buffer size. This patch replaces
it with strlcpy(), which ensures the input is always NULL-terminated and
prevents overflows, following kernel coding guidelines.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 scripts/kconfig/symbol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 26ab10c0fd76..c44e8ac3e9fe 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -777,7 +777,7 @@ bool sym_set_string_value(struct symbol *sym, const char *newval)
 	else
 		return true;
 
-	strcpy(val, newval);
+	strlcpy(val, newval, size);
 	free((void *)oldval);
 	sym_clear_all_valid();
 
-- 
2.50.1

