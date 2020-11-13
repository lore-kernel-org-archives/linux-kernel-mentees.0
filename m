Return-Path: <SRS0=I6GU=ET=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEE2C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 13:49:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20D9822201
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 13:49:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLK9hnuE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20D9822201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C61A1204C2;
	Fri, 13 Nov 2020 13:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PXlIh4q2f5Gp; Fri, 13 Nov 2020 13:49:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DF61C20439;
	Fri, 13 Nov 2020 13:49:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9E53C0891;
	Fri, 13 Nov 2020 13:49:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C1FEC0800
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 988C686974
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ghdALpqIxDO7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:49:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DB19886936
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:49:10 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id 11so10768050ljf.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 05:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xoAntw85OrO2y0K3IAZBBg2WATXrCYStlI6/UApq39E=;
 b=mLK9hnuEq73D5EM9nyjCIOx6eLT/2setVaiAMtJLoRFbcVnAEs34FHY5KSBoFGb4RG
 qdLhV+SQGmknqPJU4PBDSIZF9g0NYkmXfqlODHEm+gRhVVuqLspJjOyW9IeUAljYqncm
 Hr1miZ0A9+gJliOQ+5iFFK/XGE1yy3xjlnewK2Ske7EMsuQQYnROPGeAnZiFt8ySc+GQ
 plpFfKNwV/aqn5N3Rel8Ly4gXqZvtX2MXMxIIGSFOwTjqPMuqyxfRYTmAyR46WIwacGU
 DWoyB26SP0D0UDOlo3vTikptKi+MzSziWwIbG9rcQW2H3bJUvsK2rIeRxGfNTDUTZrL0
 XCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xoAntw85OrO2y0K3IAZBBg2WATXrCYStlI6/UApq39E=;
 b=n8yMs5+akd3/MMngN5ZSnWhL5TIPeJlAZkC1HaoxQ5iNhWf4ULI5VApQux071pB3II
 jtgcpvctKwwzh9QzkSmc+roBALAdAvmeCGOaBL5cUmetCMQsKpSQsg4Zkar0QzNS2Eo8
 LK3BQXF0JNblFkrGwTb9NvH8pqB6LxhMLCa6BSiBQOrtQLJdXS+/B1JhqE6kk2Z6ci1Y
 NbVopfRnySs/oF+VVjzzqdvpVog8WcJBHAIYRcQJGaz0wos7aqo14Kvi9ftm6EJtJupF
 ABCHuH7YwFtDxwBoo6yqZEDJ0l2HhyorQ304gdKiBJmfGOjW9JAc1xlDqoqxpLlsmR4B
 3Nsw==
X-Gm-Message-State: AOAM533wNvLbx/De7mDBVOjrVeXncBxEtvkeJq6FTZ1Zh62OO6Yi1qob
 yS/9VwAy5/mGk2y+Tn2wRqSOOmBjCtOU2gxeQA0=
X-Google-Smtp-Source: ABdhPJzGRYNWvBxCbPT+1DHkMoaBf0rUlZ+FCjjE5ZGzGD1kkmGBSMGhLTj8ItfaR3/7NfWyFvRLXdoz3BzZZwnd7YQ=
X-Received: by 2002:a2e:9dda:: with SMTP id x26mr1082935ljj.331.1605275348829; 
 Fri, 13 Nov 2020 05:49:08 -0800 (PST)
MIME-Version: 1.0
References: <20201113131037.37519-1-dwaipayanray1@gmail.com>
 <CAKXUXMwsvj6Y3dEq-eAOyCoJV3qhV7K9U_uRrtbg9u4TV0zyeA@mail.gmail.com>
In-Reply-To: <CAKXUXMwsvj6Y3dEq-eAOyCoJV3qhV7K9U_uRrtbg9u4TV0zyeA@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 13 Nov 2020 19:18:37 +0530
Message-ID: <CABJPP5D5TyJcnkmJfLU8-AE71SAuDOYKpLSoXvOy6889agUutA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix typo and remove
	duplicate word
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

On Fri, Nov 13, 2020 at 7:04 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Fri, Nov 13, 2020 at 2:11 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > Delete repeated word in scripts/checkpatch.pl.
> > "are are" -> "are"
> >
> > Fix typo "commments" -> "comments"
> >
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
>
> Does this make checkpatch.pl pass checkpatch without any further warnings?
>
> Nice idea to check if checkpatch.pl still fulfills the checkpatch
> rules we created...
>

Yes, all the rules pass.
$ ./scripts/checkpatch.pl --codespell --strict -f scripts/checkpatch.pl
gives:
total: 0 errors, 0 warnings, 10 checks, 7233 lines checked

9 of those checks are false positives. There is another misspelled
word:
#5003: FILE: scripts/checkpatch.pl:5003:
+## # falsly report the parameters of functions.

I will add that and resend.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
