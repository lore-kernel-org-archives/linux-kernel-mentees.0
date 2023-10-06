Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624C4E81E10
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Oct 2023 15:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCAD26FA72;
	Fri,  6 Oct 2023 15:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCAD26FA72
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DdeXXAGx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DVmezk-PKkZa; Fri,  6 Oct 2023 15:56:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3209060FAA;
	Fri,  6 Oct 2023 15:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3209060FAA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0AE20C0071;
	Fri,  6 Oct 2023 15:56:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D86FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 15:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9E236FA72
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 15:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9E236FA72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gG5ylb0lgIe8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 15:56:02 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 665FC60FAA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 15:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 665FC60FAA
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2bfed7c4e6dso26146271fa.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Oct 2023 08:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696607760; x=1697212560;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p79UdREZZAqJEG4ed9Cqy6ZZIFZqKWpUabzxjEUQnwI=;
 b=DdeXXAGxQd/kR38ZC9hdL9BpY9eQ1jYHlCIjI4KXI5gjRzufUBLADMd5g6WyxXlJyS
 tZZeS0hNyrfALQFfIfLU+HSylIdozFQLO9hc+ahqrPgOoSe+rKZQbHT0tZCNrGmhOums
 FrdI6S7ksn7q3p3hQUCNj7uhVIpD7x1dkNlfuV43M7nAr7bXiM7QiexKDq2GT0ZlUjAT
 i/AdlO/KuiLUXfDxCxuAFJicvwRdclY1kZpgmfA3tAO+B5gcdkqLZ4k81at5LKtGa/Gz
 +szQ0kc35BvG/hfHuWCjiFWhr7dX7lJkwl5h2qhnlQn4I4JeZhyjMkHCKzvUkWSwNZmz
 lZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696607760; x=1697212560;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p79UdREZZAqJEG4ed9Cqy6ZZIFZqKWpUabzxjEUQnwI=;
 b=Q9dDn7Dvwl7FuP6CqwScvbe+r7ThCVvmproRb1BT9w6782cwwS28/iPuPNeT2KHTTj
 Up+u8b8XaTnT8ZRgvJDxsu+UP2K//bD22xarBxNlvOBTuZI4zAC1e98y3fnACmrmS/2a
 5TcgfMkAOMy2c1+eroo2uS6CT2IOMsmK0H1K0L59CVpJxPgbSEQwT3GxhcER1bJVtjOE
 yB5c0wWRKz1DVrUuuDL/W5b7RcEDmj+QoAtyijb2sK7dzR4pAU8iitAb+Jwrqcf/wB7S
 9lzEuouh2d1KGCdXcJhHPU5dlip/xvMYTo+z1jdzO8zG7+4NKUYeUUkjFexi/z8NQ04X
 LKhA==
X-Gm-Message-State: AOJu0YyR3ATdcQE4ikFbZxolHlx7JR1EKuXIjmLp9t42z+0e8GjJOS61
 w0Y4McPpeHuaz8bDkT4XuYI=
X-Google-Smtp-Source: AGHT+IFUwTAmliU6/8HaySJamov+AdflUtJK3/o9el7FvFWytzQwSVGEK8537qPiiJ7p1RoiHOgTKw==
X-Received: by 2002:a2e:9f42:0:b0:2c0:c9e:e276 with SMTP id
 v2-20020a2e9f42000000b002c00c9ee276mr7623038ljk.31.1696607759663; 
 Fri, 06 Oct 2023 08:55:59 -0700 (PDT)
Received: from localhost.localdomain ([77.222.24.57])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a05651c102d00b002b9e9a8532dsm825978ljm.138.2023.10.06.08.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 08:55:58 -0700 (PDT)
From: Andrew Kanner <andrew.kanner@gmail.com>
To: apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com
Subject: [PATCH RESEND trivial v2] checkpatch: stop complaining about tags
 suggested/tested by syzkaller
Date: Fri,  6 Oct 2023 18:55:02 +0300
Message-Id: <20231006155501.3120-1-andrew.kanner@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

If you submit a testing request to syzkaller it may reply with:
> syzbot has tested the proposed patch and the reproducer did not \
> trigger any issue:
>
> Reported-and-tested-by: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com

Checkpatch is ok with Reported-by tags, but complains about
Reported-and-tested-by tags:
> WARNING: Possible unwrapped commit description (prefer a maximum 75 \
> chars per line)
> #48:
> Reported-and-tested-by: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com

Adding the new tag to signature_tags removes this warning.

Signed-off-by: Andrew Kanner <andrew.kanner@gmail.com>
---
PS: It's expected that checkpatch.pl will complain about this patch for
checkpatch.pl, although I tried to remove some warnings - see below.

v2:
  - suppress 4 warnings from checkpatch.pl, adding '>' to commit-msg
  - ./scripts/checkpatch.pl is still complaining about this patch
    (mostly about the keywords in diff):
      total: 6 errors, 14 warnings
    although it's not complaining too much about commit-msg (only about
    Reported-and-tested-by tag)
v1: https://lore.kernel.org/all/20230829123446.3455193-1-andrew.kanner@gmail.com/

 scripts/checkpatch.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7d16f863edf1..a9dbc9c6e26c 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -617,6 +617,7 @@ our $signature_tags = qr{(?xi:
 	Tested-by:|
 	Reviewed-by:|
 	Reported-by:|
+	Reported-and-tested-by:|
 	Suggested-by:|
 	To:|
 	Cc:
@@ -711,7 +712,7 @@ sub find_standard_signature {
 	my ($sign_off) = @_;
 	my @standard_signature_tags = (
 		'Signed-off-by:', 'Co-developed-by:', 'Acked-by:', 'Tested-by:',
-		'Reviewed-by:', 'Reported-by:', 'Suggested-by:'
+		'Reviewed-by:', 'Reported-by:', 'Reported-and-tested-by:', 'Suggested-by:'
 	);
 	foreach my $signature (@standard_signature_tags) {
 		return $signature if (get_edit_distance($sign_off, $signature) <= 2);
-- 
2.39.3

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
