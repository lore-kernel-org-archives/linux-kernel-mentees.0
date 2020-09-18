Return-Path: <SRS0=/XFi=C3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72939C43464
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Sep 2020 10:06:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 054B5208B8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Sep 2020 10:06:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQU7IFrx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 054B5208B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 99323872FD;
	Fri, 18 Sep 2020 10:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zBuv1F9RLduG; Fri, 18 Sep 2020 10:06:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E444A872F0;
	Fri, 18 Sep 2020 10:06:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0FE0C0888;
	Fri, 18 Sep 2020 10:06:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B11BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 10:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 94BF287691
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 10:06:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BUDwPTQzUA3m
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 10:06:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 400EC87683
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 10:06:51 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id w5so5005490wrp.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 03:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:user-agent:mime-version;
 bh=7ch3cbW3i7Ns4UovdgQ3MyTUUnawV7fbLBpL8gUR8+s=;
 b=LQU7IFrxnwI65Nn+L0WwZ8D7FsrSq6nSXE8b9idRafG96MB7z70hMwyXETsMeiBeJS
 QoUlh/QrH0wULtRr9BgT1CCmw135Uf3DwzH8mbQIlknf4NbQngl0j0CrlTFn6KRPyDCn
 JUczsl/tl91PP5Tl1hi6WSg9HEhtH1xaWQY0JPyuHo/uSJ2uVKa6ZQHV6LBshEwDKjD7
 idhTD5IAN4HxWdL+ePH13VSVNyIaNRdwM719Bp4jK27JW/Is2AVyxFzOP8y2xiDHDWP6
 jFWSaEwqFpgo/NiSalyx5uFU5empOgYlpICDFYHFZi4PI6eUIUysdVcujuptlAkH89p1
 +zSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=7ch3cbW3i7Ns4UovdgQ3MyTUUnawV7fbLBpL8gUR8+s=;
 b=ZIyMGbW7tR8ZthMlmsIfc5okMIvC7mjavegrmW0r2m5xJMNda6rYOtoAZ6kLrgvKYW
 +uMq0xQtC+WprMi1Ph2irCa86kC819etfOScEovvrNS4O8tCbsXbOx+F0qmJzXXmB4F/
 om1SBj56s6H7Azac3foytM0+un3fusZAgoLJerhq+bq7HHh9crsymJ+0SdlSDw7y9KnH
 eLBqIS9Qh6fmn791oVEyOt+IgoCuvojDaswBJnZHwJ8CPrwiKmrBMdoa9Fqgco81S8rS
 HzoKJ46JzI/piGQnRU7Dgp0Qdspanny4P8TjG5QdLqU7DFUgDghBW6I+mLdtr93uHv2A
 G0sg==
X-Gm-Message-State: AOAM531W3lHzn6zvnSEvzNO3MGEILfAyZdG3xoA6zLgIZLcZ5+HP4Nxh
 Ijzy47pwrv0JnIEJdlTv1iI=
X-Google-Smtp-Source: ABdhPJy7irl3AUN+lI9CR/N8vUxTcYx0WSyJE7qJWUAzEAOvI9RfxSkuyG6fHhuChVQvBtvFSO2sfg==
X-Received: by 2002:a5d:574c:: with SMTP id q12mr36774892wrw.253.1600423609551; 
 Fri, 18 Sep 2020 03:06:49 -0700 (PDT)
Received: from felia ([2001:16b8:2ddd:a500:e029:7716:870d:7ba7])
 by smtp.gmail.com with ESMTPSA id z14sm4407024wrs.76.2020.09.18.03.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 03:06:49 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 18 Sep 2020 12:06:41 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Message-ID: <alpine.DEB.2.21.2009181157160.14717@felia>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] checkpatch.pl investigation:
	NO_AUTHOR_SIGN_OFF issues
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

Hi Dwaipayan, hi others,

I had a quick look on the NO AUTHOR SIGN OFF issues reported by 
checkpatch.pl on v5.4..v5.8 on my own small script.

After collecting all the data in a tsv (no details on that tsv here):

$ grep "NO_AUTHOR_SIGN_OFF" v5.4..v5.8.tsv | wc -l
1064

$ grep "NO_AUTHOR_SIGN_OFF" v5.4..v5.8.tsv  | cut -f 7 | sort  | uniq -c | 
sort -nr | head -n 8
    175 Missing Signed-off-by: line by nominal patch author 'Daniel Vetter <daniel.vetter@ffwll.ch>'
    116 Missing Signed-off-by: line by nominal patch author ''
     68 Missing Signed-off-by: line by nominal patch author 'Trond Myklebust <trondmy@gmail.com>'
     43 Missing Signed-off-by: line by nominal patch author 'Thinh Nguyen <Thinh.Nguyen@synopsys.com>'
     40 Missing Signed-off-by: line by nominal patch author 'Pascal van Leeuwen <pascalvanl@gmail.com>'
     36 Missing Signed-off-by: line by nominal patch author 'Alex Maftei <amaftei@solarflare.com>'
     31 Missing Signed-off-by: line by nominal patch author 'Valdis Kletnieks <valdis.kletnieks@vt.edu>'
     24 Missing Signed-off-by: line by nominal patch author 'Luke Nelson <lukenels@cs.washington.edu>'


Here a quick look at the first two:

    175 Missing Signed-off-by: line by nominal patch author 'Daniel Vetter 
<daniel.vetter@ffwll.ch>'

$ grep "NO_AUTHOR_SIGN_OFF" v5.4..v5.8.tsv | grep "Daniel Vetter" \
  | cut -f 1 > commits-NO_AUTHOR_SIGN_OFF-Daniel-Vetter
$ cat commits-NO_AUTHOR_SIGN_OFF-Daniel-Vetter | \
  xargs git show  --format="%b" -s | \
  grep "Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>" | \
  wc -l

So all 175 commits are of the type:

Author: Daniel Vetter <daniel.vetter@ffwll.ch>
...
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>


and the second:

    116 Missing Signed-off-by: line by nominal patch author ''

That is probably due to not parsing the patch author with a line break.


So, if we can find a solution for Daniel Vetter (of course, not 
hard-coding it in checkpatch.pl), e.g., by adding a .mailmap entry for him 
and making use of that in checkpatch.pl,

... and for the encoding problem, then we got around 27% of the 
NO_AUTHOR_SIGN_OFF 'problems' solved. Next, we can continue to look at the 
next few remaining ones. The longer tail of warnings are clearly warnings 
that deserve to be pointed out to newbies with a broken setup.

I hope you can continue to work on a solution for this class.


Thanks for your initial investigation,

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
