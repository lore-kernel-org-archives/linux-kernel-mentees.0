Return-Path: <SRS0=qsl3=IH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E58C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 Mar 2021 12:53:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE5A96525F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 Mar 2021 12:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE5A96525F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A11186F5A9;
	Tue,  9 Mar 2021 12:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIp4IPd6SLNq; Tue,  9 Mar 2021 12:53:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id C429A6F521;
	Tue,  9 Mar 2021 12:53:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B186C000A;
	Tue,  9 Mar 2021 12:53:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A424C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Mar 2021 12:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3634140183
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Mar 2021 12:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 09qVoy9vPC_4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Mar 2021 12:53:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6D8340177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Mar 2021 12:53:34 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so4952875pjh.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 09 Mar 2021 04:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7ONx2FOzWIgS1h/Pt0rxIhJX/kU2VsrARJ7BsHy15OI=;
 b=As/Wcc+Nm78iyZnkMMtOT6fGyXZyC3DHVFw89k3TlkYga5f+rKBaYOvVgAqJtypnYK
 R21+jzQbgGr4Gd1sk5HPbHfBO5jEGBrjyWxGISauE3fLwWe/ffth+ifVrC4i7ksKR+5v
 gn5t6weqhxEzl+U6Gyt/RwPp+k7CtH4e0FULDaOoZg+GX7ZgCSRSK0DfVz5QEv0MP41I
 icWlvpX9wYZX/4dHRadJ1mLlg2MPdPJQHlub8+NC4EzEkgL5jNFl2p53+aQ6WEKEWRM+
 PjPcnkH/fq7CMSEboVD9kRz0SkBTgeYQbj8pWhvYWki4mTbJND6p0x2aSUltlHSqfVF+
 PkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7ONx2FOzWIgS1h/Pt0rxIhJX/kU2VsrARJ7BsHy15OI=;
 b=nl4XIgkKA4tDk9OFiN/xNL8Z4e5SSea5CNVXMiJ8XcH+R7y+mIv1hvXaeswW6jbkRO
 MRHhSjQCsXenZCBNVEVcKMFhlPYSJGreYqjF8MtoEXB09C8tpsLehNQgA8atB8wli388
 S0Rphw84o21pZMAQVtE5xyCp40O0DFp4NZvHumeiNzgolCHLzwk3r4/e1wN3gKetE3jI
 81QfNZFHn7O+q3g1AcbU3CGuDAnNjdJ4uwft+xmeVbrvhlDt72vC7mgFjcX3FdcXimhB
 QWPoMw0n5Ql94HVLM0uWOxcM0QCvnqv9QM/po+edy6RdyVKCpWnRgNqlZZI82CQ5U+W8
 uo3w==
X-Gm-Message-State: AOAM532Ey2Y9cZRxLNhKi5PGB7PiJds6S5xZYgIZ56aau9XHsv5AqSij
 SwCKqqOsv1MJdFk2WIoovd0=
X-Google-Smtp-Source: ABdhPJyFTdNLtllnen9bXqUvuviYG1ht1aZEMb65CmDxsBfkktSxfZy7nikXYd1iICBRKl1W5xlItw==
X-Received: by 2002:a17:90a:e298:: with SMTP id
 d24mr4542602pjz.171.1615294414128; 
 Tue, 09 Mar 2021 04:53:34 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:f1c9:5654:cd78:ceac])
 by smtp.googlemail.com with ESMTPSA id 197sm9192499pgg.53.2021.03.09.04.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 04:53:33 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: corbet@lwn.net
Subject: [RFC] scripts: kernel-doc: avoid warnings due to initial commented
 lines in file
Date: Tue,  9 Mar 2021 18:23:24 +0530
Message-Id: <20210309125324.4456-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Starting commented lines in a file mostly contains comments describing
license, copyright or general information about the file.

E.g., in sound/pci/ctxfi/ctresource.c, initial comment lines describe
its copyright and other related file informations.

But as kernel-doc reads these lines, it results in ineffective warnings by
kernel-doc, related to these.

Provide a simple fix by skipping first three lines in a file for checking
kernel-doc comments.

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/kernel-doc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index e1e562b2e2e7..431add05248e 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -2375,6 +2375,7 @@ sub process_file($) {
     my $file;
     my $initial_section_counter = $section_counter;
     my ($orig_file) = @_;
+    my $lineno = 0;	# to maintain the count of line number in a file
 
     $file = map_filename($orig_file);
 
@@ -2388,13 +2389,16 @@ sub process_file($) {
 
     $section_counter = 0;
     while (<IN_FILE>) {
+	$lineno++;
 	while (s/\\\s*$//) {
 	    $_ .= <IN_FILE>;
+	    $lineno++;
 	}
 	# Replace tabs by spaces
         while ($_ =~ s/\t+/' ' x (length($&) * 8 - length($`) % 8)/e) {};
 	# Hand this line to the appropriate state handler
-	if ($state == STATE_NORMAL) {
+	if ($state == STATE_NORMAL
+	    && $lineno > 3) {	# to avoid starting comment lines describing the file
 	    process_normal();
 	} elsif ($state == STATE_NAME) {
 	    process_name($file, $_);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
