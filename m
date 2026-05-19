Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C193090CC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 May 2026 02:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156338; cv=none; b=n+nXiB7kDRCaokzHJSVp5U/qAG6OakiKvTUVsRZdYGh7n5K2eMZhtiuUt9rMnVDPtPzYuNRHnpN02UJz8glaYybltRqTio6q4QyyCReY/JUe0dFAyl+HIIPKIxyVm8+D5LGGAefYliX4zvmAn+mZ61nrnB+ldfZk8CjHHH0gQHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156338; c=relaxed/simple;
	bh=pa0C9yhdgRhLGWznz7JUIUCYN54IH05uEVvyc4UBRSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BDeSlt4N7mSDTVnEtUdzDG8SBgk3X7xEWjxvEm5W7A+j54RXPWY+WrqYiHr4SPg4JdrcGG7/O+phcvTUUIVcGEWDPGA6J6yew2RNuG798q05J+2jaXc/Dx0954P6IOfSF0UxmA4rFcDuFzx6bsni43EXQXzkuWgNq6hEFNJaifU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhiUpapK; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhiUpapK"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E681860845
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 May 2026 02:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yTo04oEp1Ssy for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 May 2026 02:05:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=robertusdchris@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8FD0F60725
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FD0F60725
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lhiUpapK
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8FD0F60725
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 May 2026 02:05:35 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2b9ec9443c2so20062385ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 May 2026 19:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779156335; x=1779761135; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XFGMV7mqlPtrUKnFCz1Two2EamH1z04Y7KnQTcbEHDs=;
        b=lhiUpapKrp7qKiWwE1CFMvuCc3kwr54JLkhRqEjBOQ+DJ/w/XTawe0GwS9Ll9t7rlw
         ESX04QYEz1qKCTPmLsc08GHRSsU0P3n9nlhnWfB0z1Ljx9nLIm5VUD/Dh3TpI/vY//nC
         3oGrsV1nxyjqhhbUd0p9Txv8mrdK/3K7FhMx+BJAhvcu8sdks4c/JZ7EnRhrK7sQ78R0
         17AHFYj3LSZPz0XQJ58T/yqb5xc9ydZh9RL2mIqgSGsNaRJl+hgCeMf8tFS+WWCfcqOs
         4Y+QZdYXZIdicJIwAEDnIVmKbFp0kg7tGuMXm4OuzvuwbadAbRf2CRNrYGDW1cUd5Up6
         8YMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779156335; x=1779761135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFGMV7mqlPtrUKnFCz1Two2EamH1z04Y7KnQTcbEHDs=;
        b=HKeezEdSNVuk4NE2NywPRtcKfHa2G6BQ3jprRvifs5Z+JTGP6itRHraZk8oh6czOfM
         JpqLm76I65I9BQ2uUrOhkj6PBq+HhR+tZLXFyEXYoy/X1ggwJxz8i0R04xLTaGXNqn5D
         0NS3N4dxtqzw9XyXVFENymslezJWMFVDj8eiaFBA/2Za2AORom4OvCF3XkNF73LHOhst
         NvEvpqHOWaOhJm5JudoL1mCZ+wdjB2kVdq4As0pKSnHGz4nw7dsGkikivMt6QA0iLneS
         JRgk81CKqrmMS+cCsjwt7HBAAwI7MSCobj1Z3sFMvreECUhJ2a3RfITAkGa4A1WwrcDA
         B0Nw==
X-Forwarded-Encrypted: i=1; AFNElJ8LoSW06U+0Ndv6F6xMfd0Mjqd25R72oZ7gg81XDCJocUJZbT2QmUB6tRfXYipM/xXhIMhl4Szz0x6YWtr8IAdH7y5F0w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxvOhs4jltjncwdckYDbWZOYNqeu3XptCJZLrqYtO4/AIKAO1tx
	xUISXbM6+uOloyPebmdlege5/uG6Qvww9hy3U9jlrMwurdbfNYJEKETy
X-Gm-Gg: Acq92OEX5fO9ofS45ZBYbbxAS3r2oWeBSsOIjEMIIZUp7ccTVHHI6mvQo2IbeB1jm2A
	zgzin3VYQr1JlC0AsuCsbx3JGeYt2aaADXfdWwHd0AVnLOQqgsOY8mpX5PODBoA1K4Dtls7+d6B
	YK5/bZqAovbna1z/PzxVWeH6QtFX9b9xfdFu7icyb/jks1FrQ4GMYUvNQKpRvIs+5VccRVHdap6
	ZAVyoRG9r9oWeKqFCeBBXMxYVKqhotOjC2PgO/ZrUJ8kxdYdUC4SfKS2bNr9Nnr7zvXaPr887ER
	3PzFrSLVfDthu+2qxM+XCt59VtmcYUq52WB6ONyx2USbYtB5duUBsG/llw5Ei3xBvw+3yf7xLs/
	RzyJcAK3RYbvsmWfA7wFKu2Ymoy0JAmvtTPt3nCTJmZCQuzKvVo4S1n/EU1kHEkmdDmaPrHOytw
	hr73ti7c2sYA/p7Q7E//vXgm+JeFk=
X-Received: by 2002:a17:903:388b:b0:2bd:8c03:2efe with SMTP id d9443c01a7336-2bd8c0334f8mr135999395ad.26.1779156334703;
        Mon, 18 May 2026 19:05:34 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:dc10:22f6:2ac0:a51b:5d77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe7270sm163125925ad.50.2026.05.18.19.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 19:05:34 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: amirreza.zarrabi@oss.qualcomm.com,
	jens.wiklander@linaro.org,
	sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH v2] tee: qcomtee: add missing va_end in early return qcomtee_object_user_init()
Date: Tue, 19 May 2026 09:05:28 +0700
Message-ID: <20260519020528.133623-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcomtee_object_user_init() is a variadic function and when the function
return because there's no dispatch callback in QCOMTEE_OBJECT_TYPE_CB
case, there's no va_end to cleanup "ap" object initialized by va_start
and that can cause undefined behavior. So make sure to use va_end before
returning the error code when there's no dispatch callback.

This is reported by Coverity Scan as "Missing varargs init or cleanup".

Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
v1 -> v2:
- Use "break" statement instead of "goto" statement. There's va_end
  outside of switch-case, so we only need to go out from switch-case
  instead of using a label (suggested by Amirreza Zarrabi).
- Add "Reviewed-by" tag from Amirreza Zarrabi.

v1:
https://lore.kernel.org/all/20260513091031.145826-1-robertusdchris@gmail.com/

I don't have the device, so I am not sure how to test this change.
Thank you.

 drivers/tee/qcomtee/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index b1cb50e434f0..60fe3b5776e3 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -306,8 +306,10 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
 		break;
 	case QCOMTEE_OBJECT_TYPE_CB:
 		object->ops = ops;
-		if (!object->ops->dispatch)
-			return -EINVAL;
+		if (!object->ops->dispatch) {
+			ret = -EINVAL;
+			break;
+		}
 
 		/* If failed, "no-name". */
 		object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);

base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.54.0

