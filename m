Return-Path: <SRS0=/60u=EZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E4DC64E69
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Nov 2020 07:38:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F4812085B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Nov 2020 07:38:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5y+m3kC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F4812085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B4F6886BAC;
	Thu, 19 Nov 2020 07:38:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n8G5v3s58Oni; Thu, 19 Nov 2020 07:38:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4881086BA1;
	Thu, 19 Nov 2020 07:38:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C8C3C163C;
	Thu, 19 Nov 2020 07:38:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A3EFC0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 07:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id ECE6E86BA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 07:38:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M6MtMaQD17xc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 07:38:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 09B7886903
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 07:38:40 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id m13so4938519ioq.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 23:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=I1vFTuXEZZnloOzb10ZietZjaD3TOdopKQvHEZF38Bg=;
 b=R5y+m3kCqXI3NG4WjAkrDf10+i30hricbcN9rQ9d861n3tCKtbWhVmd165FsrE1y3U
 O5ZoyPky74Ft6qta8H8L7PKPxk0cXqBycQoWE8W12Jk0ZV6UL9/nYuT0Jx/5OyLqZ3y8
 O4LvqKXEZODHUdGrEmBSzT+nr9PY203YzF14HVjzIHclWQYl5yKoMT5dKqi/v4oPQVlD
 32YjX77PQOuxrXUl+AMv2DmXmfnvRXtwdN2a1Im3FVcCVVL46egJyTwDhTFr2d2cSHXh
 M6elMc9iXLD9QCmHJeRgRYZp1U/9AlFxN8UDn17JuQboLOJOA4lldjF5eY1XIvEAnpW0
 oOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=I1vFTuXEZZnloOzb10ZietZjaD3TOdopKQvHEZF38Bg=;
 b=g9m9ip91if6RQ3iCOnV8pTdkwyfEXVBlaVJ3BAZBqo2IjPrDbMYbmWVTR/9RkEbZns
 is/4cO0BXF1yLrheD3g4+6LrfsChyxDEuH+nQZX/R7g+ChXNE+NcfGUugIHTd+swRBKy
 zxrhZv8XcjZf1LOxtzLYc5po8TRliCsUTDw29wt7F9TtMZAVCeOCIqinLq4qMvN4d1l7
 oD006ejiYuTEw83kLM5l4Me6WO1Uk19DAiJ9wXry2gh+IEyoDky0dIt6gvOU/7oC97RP
 bGBazXHZh7sMHlgs5stibhaxWR32b7x24hz67quBvsYmF37lnPAXlXdC0L6ZQFkhFwIb
 LJaQ==
X-Gm-Message-State: AOAM5321mYXQWvwF8vpc8oG+9NGURYGT6hgKHLoQa/x/BbeTyCZXcm/T
 o5SJFFtaPPwzJFxGnh5RkvRFUDateJo2v79/wSI=
X-Google-Smtp-Source: ABdhPJwSWAKza0BIOTyo0qehr6N8+ywJ1jiDbnybYOp2tb96uj8VVpC977zPlgGfniPA6okUqUWc1rm8zsBqoIh42sM=
X-Received: by 2002:a6b:d80c:: with SMTP id y12mr19498556iob.183.1605771519254; 
 Wed, 18 Nov 2020 23:38:39 -0800 (PST)
MIME-Version: 1.0
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 19 Nov 2020 08:38:28 +0100
Message-ID: <CAKXUXMxNZ+PzdXHxYcYa4Yv2PO9oEx6Ob8LECc+hFzN5H_-HJQ@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Joe Perches <joe@perches.com>
Subject: [Linux-kernel-mentees] Potential new task: a new self-test in
	get-maintainers.pl
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

Hi Aditya, Hi Dwaipayan,

here another potential task for some perl work:

Implement a new self-test in get-maintainers.pl that checks if a file
entry line is already covered by the others provided, i.e., all files
matching to one file entry line is already matched by all the other
file entry lines of the same section.

Here is a quick example where I did something wrong of that kind:
https://lore.kernel.org/netfilter-devel/20201109091942.32280-1-lukas.bulwahn@gmail.com/

This needs a bit of reading and understanding the MAINTAINERS file and
what get_maintainers.pl does with those entries. get-maintainers.pl
already implements some self-test checks and you can add this check
above to the existing ones.

Best regards,

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
