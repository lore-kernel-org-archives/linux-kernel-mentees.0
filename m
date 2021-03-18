Return-Path: <SRS0=jPrV=IQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B539C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Mar 2021 17:18:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCBA564E37
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Mar 2021 17:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCBA564E37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A2B24E59F;
	Thu, 18 Mar 2021 17:18:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kjFWVLMPyXm5; Thu, 18 Mar 2021 17:18:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E05049FE3;
	Thu, 18 Mar 2021 17:18:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C32AC000B;
	Thu, 18 Mar 2021 17:18:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5D75C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 17:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6FC04AD66
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 17:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osQKN5guwxJV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 17:18:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2858D49FE3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 17:18:50 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id n138so5784575lfa.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 10:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/xTnWj/7c7qy2ihci4+Y8gZArZFtgvGoRKaFa4tN0PI=;
 b=gx8T9ew1kWacLuISFevAmlg/0TSWj6LGrBs57CPyJX4luB44zWUeTWhXt8tyDUuIE9
 YsvKZ/LldkMM/f0NQILbCGYZ655Cd9/LK0JieXnt/lpFZh1O3uRg0/fE1LyNyzCO50Oc
 bDr9cRxLuDzb0+PtOm1z8wW4Tz4ic8UQ+yW/xVEuNGXog1mLHFlol7P/+SOoFMeQAJWK
 wlDeSomtYDWWvfjqandt7a67OJexGFRRxX4+6QdfcyK7ZrhJeSDoO3xE/MF3TnkIPeBn
 RdJi3pHBBK5WxhEI9JV1mNl4jmidXPXSfvLPfZbGBy7w8RbkVTF5osRBRCYZXBfGjN2z
 eyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/xTnWj/7c7qy2ihci4+Y8gZArZFtgvGoRKaFa4tN0PI=;
 b=ZwRzIH2CHabZ2a2Ra/PI/nui4A2DDBFmHlvoGqBb18XzzMSFPGnm2HXPCxrrgAqZOB
 0pptt+lmpw0XNqruYV2P5jVfHtkO00neWOWr8zUB0zVACTx4vrVqHhcKhA7g6dNgOuld
 4SxRnO1jVFvtahOJcLpTPTFgz9ewVaAbh3k7CULfEjWmvrrEZVmRfIwtmCsC6JSsfuq7
 QHo8Pmc7p8J8qQdNj/PbxFpVcrQu1IdDDl+eprkZiNlbql9//x6ekoiQOX9jD48n6lU6
 Gx2ulZyaNBxwsY5PU7GMVIMM98gvg+1qoDRkyiirN1Mk3QOFglyPVdILHuh94ZFVSY0Y
 l55w==
X-Gm-Message-State: AOAM532rF3/dmVvjQxaZJ+2bVQLwuDcdHAIHfQixQ1Cw/RVaVNsnJdht
 1rSJD9pPhjcC/n+IL2Y5GVpVfAfBptGb92nnfts=
X-Google-Smtp-Source: ABdhPJxUwy+7SX3CVT2cYmJN2D0xs09DxE0Stt/8JLbLrbG02AYYzZD5t24i0lk+qPVW9FO74Uj2D2NpkZ+Z8an1LrY=
X-Received: by 2002:a19:b49:: with SMTP id 70mr6302090lfl.342.1616087927722;
 Thu, 18 Mar 2021 10:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5AjUJ+OWqUy7cR1Ar2zcs6QuLizciGf64WVQ-027rS=bA@mail.gmail.com>
 <CAKXUXMx-4p361gFewN61NEbrwTjVY9wZFg2i13VMZTUxiDJB=Q@mail.gmail.com>
In-Reply-To: <CAKXUXMx-4p361gFewN61NEbrwTjVY9wZFg2i13VMZTUxiDJB=Q@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 18 Mar 2021 22:48:36 +0530
Message-ID: <CABJPP5DbeBmVT5CTZxtwS2fpJtnasueaPkzUMrwzZZ51cdDRHQ@mail.gmail.com>
Subject: Re: Checkpatch still worries about include/asm/ ?
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Thu, Mar 18, 2021 at 10:33 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Thu, Mar 18, 2021 at 5:47 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > Hello,
> > include/asm/ got removed a long time back (probably v1.1.45).
> > Checkpatch still worries about that:
> >
> > if ($realfile =~ m@^include/asm/@) {
> > ERROR("MODIFIED_INCLUDE_ASM",
> > "do not modify files in include/asm, change architecture specific
> > files in include/asm-<architecture>\n" . "$here$rawline\n");
> > }
> >
> > Can we remove this check?
> >
>
> Wow, v1.1.45... that must have been taking quite some digging in the
> ancient dirt to find that out.
>
I was actually helped by an user who send a patch in 2016 to remove it:
https://lore.kernel.org/lkml/1482260987-21457-1-git-send-email-pebolle@tiscali.nl/raw

Don't know why it wasnt removed back then.
But it's safe to say this check hasn't been used for decades :)

> I agree, let us remove that rule.

Sure will send the patch.

> Thanks for the documentation effort on checkpatch.pl and cleaning up
> obsolete rules while documenting.
>
It's my pleasure!

Thanks & Regards,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
