Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26544416
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  4 Mar 2024 01:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709515563; cv=none; b=OOXOufkRTmF+UXuebxMn/Ga3TLGEl32zKzOCnL/SbZE0gAUgSGrk8xA9kp+qwM9Tc30hBjM7kjKIRQ6/nQ9lbDWZU6yFcMnpZfY8bVgOCHlIVVt9e5RYyI0pl3pv3P7aUimCFN9dKQgc3+IujGns7mB4S/twIH9eNSXapz303SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709515563; c=relaxed/simple;
	bh=PKFdH2Ew/2KszJ2KLQdX6BpPURrzDiGAHTBUa4+sX2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UHPwEfOYa5vLpex3Nl2YAdZzx9ItvXZCHfB6syLNuH7TA0cWQ8/btegAFl2SLZo4b4pxAQYiFWxC+9/r9ibQBqeHZV7Z6EvlfvfYhFAB6oBqoYrPBAOqckUhcEygCqk7Yt5y2bnOw/LQ7XvM3M10oD8QmPg4YsCGrW3Kl+30Eec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9smQnHo; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9smQnHo"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E0EC60837
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  4 Mar 2024 01:26:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3kSS3d52b8h
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon,  4 Mar 2024 01:26:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com; envelope-from=andrewjballance@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8DF0D6069C
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DF0D6069C
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q9smQnHo
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8DF0D6069C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  4 Mar 2024 01:26:01 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6dc8b280155so2890194a34.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 03 Mar 2024 17:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709515560; x=1710120360; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5CrDoOfeKlQa5JlMUiuCz6fCgu6xAbvGI8jkfEQdCl4=;
        b=Q9smQnHoPEYge7b7fXbNRjM9yODliMzDTKNFJjKtWYrpa+4lbIqCjYkW6OuDxGQI3B
         tjO7FRmPSRfazRQuiRH7xN118Ynld9E+uCQSa6V+r1r6/2Evx9HytV7cga7aYCa7cKc5
         ln8wpAHbCBRIubnRAE1ilPJ6Mj+4ChMi7yLZDETQ/PVVBIfWRxyvkceAZ0br/8w9vyf4
         3ZJp6kWOAJAs47diM8cI7TM6Bf/5ds7CETn4+IIKygpsReYVLqMS2RnrEswKJ7+adN8e
         TxtlJT5NkVOWm+03oM/ylOULckJHeiTBJenOT1qli78Jz6ggvsI1CciTUXa6ism/kkEl
         5xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709515560; x=1710120360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5CrDoOfeKlQa5JlMUiuCz6fCgu6xAbvGI8jkfEQdCl4=;
        b=Zpl64EcQDh1WwnexTqs4SKJaLfum0NUgHd5NwRdvKNhqMEr7xJGzCCBMkWDQDh+Gw1
         jdJ9xP4iCPYSTYAHVXd1GNCl0XyDvVBpJdr0IvmXK95k5tQz2IQghNyJ3zxbnqBfmTOU
         o4unkGRte7mtSVr6azORWmpEyzuyCMxTGlvWhoFlq2+cd0uBHM0Sl6M/yItHgOzvLE40
         xMpsrB2rZu7v7k+oHTOcdESCL6ILdXSDKDpVoahMkcSM+rhobNEegCRMWOtLdqyjJhBc
         ojjFpLs4hAfu5V7LDbFNmkyNPhMt63GZNMUFeX8SLcmfKJcb1zG8akFza5jwh7CEGb0+
         B1Rg==
X-Forwarded-Encrypted: i=1; AJvYcCX2RF8MX7RTwDCW7rybc0sRKcnszu6E39rpsc0FH2dD0qexVzuN4H2zU+c/37RVw2qE6EqVMAfzZ3w0YvEYWF/o/h7lLJ+zsu9+JYrJHGNtg1S95bIIhoQAvEQZZXa8
X-Gm-Message-State: AOJu0YyU5mFZpmJqCWaKCJXglSHLeJlrRUZiDSgy2Ao3kAbl9wkOAEvC
	IR+TL9xKwdHbJotOrUQo2Auj58Nj6uuONHz9KWvX2ajmXYxlgsDI
X-Google-Smtp-Source: AGHT+IFZAhY+aHDoE4UmJ4YAzthSlrYX3qSCpjstZvsoP2lK4CgQ4aPMAZyXOMranELQKmYY9IwDFA==
X-Received: by 2002:a4a:2b42:0:b0:5a1:2947:c4bd with SMTP id y2-20020a4a2b42000000b005a12947c4bdmr1367268ooe.0.1709515560427;
        Sun, 03 Mar 2024 17:26:00 -0800 (PST)
Received: from my-computer.uh.edu ([129.7.0.68])
        by smtp.googlemail.com with ESMTPSA id c18-20020a4a9c52000000b005a056b5e37asm1815345ook.48.2024.03.03.17.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 17:26:00 -0800 (PST)
From: Andrew Ballance <andrewjballance@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: mcgrof@kernel.org,
	Kuan-Ying.Lee@mediatek.com,
	koudai@google.com,
	p.raghav@samsung.com,
	akpm@linux-foundation.org,
	kbingham@kernel.org,
	jan.kiszka@siemens.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Andrew Ballance <andrewjballance@gmail.com>
Subject: [PATCH] scripts/gdb/symbols: fix invalid escape sequence warning
Date: Sun,  3 Mar 2024 19:25:07 -0600
Message-ID: <20240304012507.240380-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With python 3.12, '\.' results in this warning
    SyntaxWarning: invalid escape sequence '\.'

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 scripts/gdb/linux/symbols.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
index c8047f4441e6..e8316beb17a7 100644
--- a/scripts/gdb/linux/symbols.py
+++ b/scripts/gdb/linux/symbols.py
@@ -82,7 +82,7 @@ lx-symbols command."""
         self.module_files_updated = True
 
     def _get_module_file(self, module_name):
-        module_pattern = ".*/{0}\.ko(?:.debug)?$".format(
+        module_pattern = r".*/{0}\.ko(?:.debug)?$".format(
             module_name.replace("_", r"[_\-]"))
         for name in self.module_files:
             if re.match(module_pattern, name) and os.path.exists(name):
-- 
2.44.0

