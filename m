Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D19A5381
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 06:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVsEoqml"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9276D83C87
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 06:16:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9276D83C87
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fVsEoqml
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6xmoq9Qh7gG
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 23 Dec 2023 06:16:57 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B3E5783C80
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 06:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3E5783C80
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7ba834684abso103659439f.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 22:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703312217; x=1703917017; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v7njaXclry8FJLwii07+vYUOoiK5EVEJQBJVFl/kxqE=;
        b=fVsEoqmlC3Aj6SDuRaGF4YE6dBVeLuQV76z500dggyAkPamusD4zQT7ClvtM+qvTkt
         tPc1FmjECVkYPVUSjsQbt9jqgvy/Ez1876FrkIWds2JLde/AbkNUlapMDMyU6iQZsCoS
         Nzf0tbyg/uPHGmykpH3jnogdD456HOmM2vFWfyW+gKOskxFkG57Uc8knh+nKJr6Mb9Gm
         vlyfOnptEEdLtP77k6FFwN+WWB50pu8RQ5q7LWgb9IuB9hK6GgOdDbkmdY1qcdMJ6wRx
         LaaJwRk/Tvew3QY7U2ZGFrFaphjgJhO3V9t03eZJqBLljPHY3hy9bqhcW24rrT87vFah
         iu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703312217; x=1703917017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7njaXclry8FJLwii07+vYUOoiK5EVEJQBJVFl/kxqE=;
        b=KpQB/svrR5PLvHOWpN+KLENGL7i4AMAmOzMBbFvf7yqGdQXXMP8A3ThTVsbTPTNvr3
         8n1XqkIkLrbQ8iUYVfus8NQlPgRFxLMIlXIVF68A1kFSVJorLuWaRLc4wBEbuIhS7sgw
         SULA7l2qC/mc+VhC8qdy23DAeQcFYCNVBqjfkfmrzgKHm9jfh8l2gGHgQLMo1D/32KPn
         Nc4RneNvisxuerx0pUvoXeEeks3aZrValYjR+8oG9c1vkV2Sz+o0b6DpsO2hoqdGL2LP
         wrqy8Qg66PkwT6Ak2/ZtfQ/2dq7DgyApLvR+IvhDPI7u348OODRKbF4TV407dIcLudwt
         nW6w==
X-Gm-Message-State: AOJu0YzvU1qslVJdwK6NaQFG8TlzmYpW3r9LCOjWCwMNasA1APkM54fK
	0/S1fpGqb1pJbTNRdaXsnMM=
X-Google-Smtp-Source: AGHT+IF8YJ43SrzDQe7J5DlABGxtPTsbfEZgJo+fSABzEFKyifcAkhaVcjxBU16GO8jG8S++691oBg==
X-Received: by 2002:a5e:c80e:0:b0:7ba:813c:39bd with SMTP id y14-20020a5ec80e000000b007ba813c39bdmr3096868iol.42.1703312216698;
        Fri, 22 Dec 2023 22:16:56 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id f26-20020aa78b1a000000b006d97f80c4absm3024061pfd.41.2023.12.22.22.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 22:16:56 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media/atomisp/pci/base/circbuf/interface: Fix spelling mistake in ia_css_circbuf.h
Date: Sat, 23 Dec 2023 12:01:47 +0545
Message-Id: <20231223061647.78669-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported following spelling mistake
in ia_css_circbuf.h as below:

'''
./base/circbuf/interface/ia_css_circbuf.h:76: poistion ==> position
'''
This patch fixes this spelling mistake.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 .../media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
index 0579deac5535..e9846951f4ed 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
@@ -73,7 +73,7 @@ uint32_t ia_css_circbuf_pop(
 
 /**
  * @brief Extract a value out of the circular buffer.
- * Get a value at an arbitrary poistion in the circular
+ * Get a value at an arbitrary position in the circular
  * buffer. The user should call "ia_css_circbuf_is_empty()"
  * to avoid accessing to an empty buffer.
  *
-- 
2.39.2 (Apple Git-143)

