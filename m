Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8EC111B9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 01:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707873934; cv=none; b=VVGn0JAYYAz53N4uPdrepGgUO3Z47B97AjpxZlflFq/QHFUgeu8nwjCGOAuXfsefpIr80AIhQsfQzPxi7vCc9W+msnkHofWX22WVvIoqifwrFx+TVbFQ7saWJcDNs4GXg8O2MEjhTraXsddXfy4D3vFih0GCb2c0rsaDVfFHtq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707873934; c=relaxed/simple;
	bh=yOEMQLS0HBWD1xpp/GEUAOHOe6zYSrs6EjP/pYr8yKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oep1tzOn33Lq8tdjTLk9SkTROD27aKm2AueyWiT5IgsPaDnbYH8h3A7S8qZWvTOqN8b6FUp6jg0n1nG8lCXo6sCXmsdZFgjWmmzRRQJ2fhr+tYIapN4cDjXXllc4Ttu18zeFZ1T7g81ndw18RWmhDq7dHFMFn87uynpLip5rVug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbTDdppl; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbTDdppl"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D737940572
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 01:25:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4RynSNvIhZYR
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 14 Feb 2024 01:25:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com; envelope-from=andrewjballance@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 312104055C
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 312104055C
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fbTDdppl
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 312104055C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 01:25:32 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-2185d368211so3167408fac.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Feb 2024 17:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707873931; x=1708478731; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zqcKGjJIq8z28bcz9jGNmiRh2zlXlrXCYNsKpGAsbk=;
        b=fbTDdpplj430o5RIGnKbNLWu6M0ag/MetQc0GjnSTKIwJlCog7mNToTsgVZyJqGv5r
         H7wlOO5qL3wqpX2H4TBYcSNBXfJUJ32uRIN3otDY6SkR/E0UzpToyrI0IJPNl8+tdWcy
         vtmV87VrRltu2sE80GEoNodBxtgec0Bz4xTVsudiKzrFIGUIUvcBerv5tYPrJrCbpqMR
         1EW3zObOXmrrTMRNH2X0DfUnfnXhABPg4bBrv9uQPHcMwgpFYEe9laSRz0LrLYiMbbMl
         VjWcC3XASAjOGzJLHNsQy24KHJSXxTXdGagXaiUwaHLdaRJigg1uX+BV6r4IeYhz9Ih8
         ZDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707873931; x=1708478731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zqcKGjJIq8z28bcz9jGNmiRh2zlXlrXCYNsKpGAsbk=;
        b=WJ7OLV0dsAFCcMeS8YMEDW2/oY9IvvKuwyMHyMgTPQh9wmSR2CIED3j4gw0P1PWSyg
         itintBEuIrsx8b/P1VC2Kpn7j3PzsZqv3qYdQQvIb/b3so9K7n53lNj0ROKc0grLF7uI
         wzaIsmVfNswX3DPnRmTFh8t6GoYjFw4b3+A/vAAEK2MZAM/il8SC1vQkeDDaKmd87dER
         p/iCMHVzerZnJ9wIRQy+5ULPz3ZI1JdI/h38wTsNVjX2zcWFvAJMolCFNP21jsWr9qZo
         PxYi5Q3LxeEjXlO9qo+ltG4cexyptu87fP/fD9Qr5aeuMArWZmKOeOzvdzcO2LEKFwev
         u6UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJCcaKpOEQyfK4p2I7XlAyNakv5E7kuyMTOItHCAdTThwoN87bDbuQxOTVLjvMr3r4oH0/AtjJ8ORpphsPt+O8tFJeJzFVZVh9MRgq1J3N1v/yoYAXzieaPzPBJJQY
X-Gm-Message-State: AOJu0Yy0uh14hYxIbBb9h402IMPi3oSKircSVStsR/vSZqXbfGwcPeIu
	jkmh5l+Tg19VpbrNR1fLfhXo7Xokv6GFtyQfLbWCbVATbLJjiRPh
X-Google-Smtp-Source: AGHT+IGkPWH3yWst8zIhaEqoltQddmcw8FOkSPKhRemNOFMvUlGw/MFK4UEg1BMeMV6v3qIWULcviA==
X-Received: by 2002:a05:6870:84c2:b0:21a:216d:3a6a with SMTP id l2-20020a05687084c200b0021a216d3a6amr1195402oak.52.1707873930990;
        Tue, 13 Feb 2024 17:25:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVv1/HqwbbPQn8gnhT+3LrX1gtJKlF9y4+dDoI8DuptB9zKlMmYPlEA9NbSXc7Wg1qo5pU1tT2nPwL9R7K/x0hS8W2NQ6FKvh7TFU7du9IwKDTWJTsYCzl/xgDX+pM/hBynoFTzCmtPyjqMTRnatvME3uCT2Yqmi5r+5/X0m9XOEvFf71xLF6HJ+Ch6gyxc3oAatPw9jPfzVxMrjPDUyVy52T5Bw1MDX5whs0UBXXDKWBKTXiat5eSwOir99hrhzR55jp4MkLwW9bUTSdGhqpz3tDxveYLBih+jg96V47GtOSIU7CQgGSijeXr8yIqDqpHgHVxhT6CRRwcHPXkVM1VAnhcr4WDy1//qmSNJLrIip2eevvh4bpwaApC0+d3Thzy0pToic/MDQa9oeFNNLrBhhR8=
Received: from my-computer.uh.edu ([129.7.0.170])
        by smtp.googlemail.com with ESMTPSA id pc7-20020a0568701ec700b0021a89fff00esm572928oab.19.2024.02.13.17.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 17:25:30 -0800 (PST)
From: Andrew Ballance <andrewjballance@gmail.com>
To: justinstitt@google.com
Cc: andrewjballance@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	masahiroy@kernel.org,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	nicolas@fjasle.eu,
	skhan@linuxfoundation.org
Subject: [PATCH v3 1/1] gen_compile_commands: fix invalid escape sequence warning
Date: Tue, 13 Feb 2024 19:23:05 -0600
Message-ID: <20240214012439.879134-2-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214012439.879134-1-andrewjballance@gmail.com>
References: <CAFhGd8pvhzehMGh1XEHBct7CGEQuF0CZeneMH3D6cKSRj5UdHQ@mail.gmail.com>
 <20240214012439.879134-1-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

with python 3.12.1 '\#' results in this warning
    SyntaxWarning: invalid escape sequence '\#'

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 scripts/clang-tools/gen_compile_commands.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 5dea4479240b..e4fb686dfaa9 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -170,7 +170,7 @@ def process_line(root_directory, command_prefix, file_path):
     # escape the pound sign '#', either as '\#' or '$(pound)' (depending on the
     # kernel version). The compile_commands.json file is not interepreted
     # by Make, so this code replaces the escaped version with '#'.
-    prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
+    prefix = command_prefix.replace(r'\#', '#').replace('$(pound)', '#')
 
     # Return the canonical path, eliminating any symbolic links encountered in the path.
     abs_path = os.path.realpath(os.path.join(root_directory, file_path))
-- 
2.43.0

