Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8680C1D1300
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Nov 2024 15:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732031001; cv=none; b=tF6zNXjNHzo01d01qKy0ViaIM0jyeD3XLyGxXZshIAVuRpWl2GElcWZeRKLWyXmdf19pTfQvm6F5KbwVsBWYa7pHuA6k2sqZ8RR+I7Be/k9Gc+A7RYFvPHtYtxFKB8w0Xzna3xi1HJ1OcJ3LGYQiaaRgOaRmMTjIJCLtt+r33bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732031001; c=relaxed/simple;
	bh=FkL5bkKtAiHvQTF29E9UZy7IZKVw5GcwQnU8LPk+eyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FB9wpNYAv85tCZaVpRo/Qs/M/dYlYOlF4m42bg/pf/KSG7Ge/XSnn5yEHtikYEPy5QZJ4nMrFAFG7L/CIkVur1v/ZzeBDi2++3m2KhVOmk3zCRiBLRZcxe092gwfLmTek/aKZkG/pFgG54CqgmT0EGPkRG/I8tpazI01wz5GUm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7riE+wc; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7riE+wc"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16B6A4EC27
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Nov 2024 15:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BX-ZMaqtyL2G for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Nov 2024 15:43:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 052454EC20
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 052454EC20
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F7riE+wc
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 052454EC20
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Nov 2024 15:43:16 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e382589e8fdso4052542276.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Nov 2024 07:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732030996; x=1732635796; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wEGUj1o7pb0AzUqV7Fkn4ZlKTwE9iZsUWbsWf714dAg=;
        b=F7riE+wcFqMoOcbGwXEslpPp8/kkj+qOq8w2F9ltDG7J866ZJq1L/1HZpi3EbtOD0k
         rDsv7U/GA8R7wH4cIWpWs1jEckgvrsEcedgAbMZzbsXY2OZyAlsK4yWr/vd6zH7Sm7B4
         i1CZ6vf7v8v0AhCEki5rU3uZAFz9S4G4KUsk8poWwa3Q5jsJkka1cs9T3NJCHMwfMRvy
         mj4u9VoB/GAi8fmXfefYsmD0C5C8I0wEI7mdgXsTBa0PgrLnwA4HiSpMKbTa4boo1XhO
         RcErVFE3pnADA1ga30UM/QxQDZea8kWbNO1F4nyaacW0WAUBrjeIqc7RPkfttrL9XMLF
         qtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732030996; x=1732635796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEGUj1o7pb0AzUqV7Fkn4ZlKTwE9iZsUWbsWf714dAg=;
        b=B9TPhGaz+eRgT2XL9YGsQIRyKM7UQT+53BuXXiPW9pjPvMyE64fyycNLNwqkgiNv18
         aOOKnzYRq16Ax501d/vMxDB9M6zdzXJbpzPKa0/wy0E1TR0yZJpdA1ovNe6T4FsXRN6I
         CRRsngVM3UUApKkZv+N9sBjNsYzaSfE+poZ5fXFRmIZ7tMBtjI/eq90Xp4zzBzDZsrJC
         My4Kq2NVfaxX7xFd8uOJ/iythsj49WzzWpbb9pFkdFLJuNixE5s78g6YZ+6s7/jrYOYn
         HSIJVE2DZO7QDXH2H5bTvZizLmdu5isweitbIaz2oVAKlCLcwMKTu4XwBJbDOeZZQB+W
         7JyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/n/0m+SuAxZ1dcHbQsthyBlO3u6n9xUsUGyGEjBJ0wNzpgci25lUNSBRHsqg3yFWU3e1tNn1cwTtyi0B/LLwyHbiUmQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyOJB8uhTjF4LMN0fuy3VBdCRqjBAYcM29fkfe9Jzzuu/lILeuK
	vq21dK14j8rnt0z5+1lwi051SNqtl08nyEC/yX4BwIaXIQTzpL7G
X-Google-Smtp-Source: AGHT+IEdUneL+IdFdTDxewMisaVAR0l3eDRbxXY6aYZEdvtBXu14ad10c2xaIszw9JSsl0K5XvOwiQ==
X-Received: by 2002:a05:6902:1022:b0:e38:8a7e:6a6 with SMTP id 3f1490d57ef6-e388a7e16c5mr7387684276.11.1732030995702;
        Tue, 19 Nov 2024 07:43:15 -0800 (PST)
Received: from x13.. ([157.23.249.72])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e387e763c98sm2530152276.28.2024.11.19.07.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 07:43:15 -0800 (PST)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	skhan@linuxfoundation.org,
	ricardo@marliere.net,
	linux-usb@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Documentation: usb: dwc3: remove deprecated member
Date: Tue, 19 Nov 2024 10:43:07 -0500
Message-ID: <20241119154309.98747-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch updates the documentation for the dwc3_request struct,
removing the sg (scatter list pointer) member.

- Remove 'sg' in the doc block for dwc3_request

This change resolves a documentation warning related to the missing
description for this field.

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
v1->v2: remove unused sg struct member as per review[1]
[1] https://lore.kernel.org/linux-usb/20241119020807.cn7ugxnhbkqwrr2b@synopsys.com/#t
---
 drivers/usb/dwc3/core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index ee73789326bc..3be069c4520e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -956,7 +956,6 @@ struct dwc3_request {
 	struct usb_request	request;
 	struct list_head	list;
 	struct dwc3_ep		*dep;
-	struct scatterlist	*sg;
 	struct scatterlist	*start_sg;
 
 	unsigned int		num_pending_sgs;
-- 
2.47.0

