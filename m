Return-Path: <SRS0=/XFi=C3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77BC2C43463
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Sep 2020 10:30:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFDA2208DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Sep 2020 10:30:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qs/ERecW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFDA2208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 70B8887317;
	Fri, 18 Sep 2020 10:30:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GWpVvIPmeHlG; Fri, 18 Sep 2020 10:30:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3EA9387313;
	Fri, 18 Sep 2020 10:30:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24260C0888;
	Fri, 18 Sep 2020 10:30:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73D97C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 10:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5AB40876BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 10:30:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vcYh+XY6ezDQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 10:30:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6CD92876B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 10:30:18 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id z26so6378024oih.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 03:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gloWWpgIeLWye5Vz6bI3/eQqdbtxEn3w2Sp7Ws2GB4s=;
 b=Qs/ERecWu+0/y7q3Ll1Uiy8lj/r6m/Zr+Q53lsEJAV/214e58lRSAZSL+l1O94Bhhj
 vDn4xlUMiajG0+YmXFqJqqkG4W6Dgv8kvgBWHvNxbVPoRpQzpsTgd12gb86aYk1PWsLj
 CF461v0+dpPxX1RGbBw9SOo6bwjsJZUWimQN2a20/M1DskQ8Tjl5UrRNsXL2UoPuIu5Q
 ehhaUEBB54SToG/aDgBkGGFNtgjHxFDbzHTMG9SMGeXu2rhK0VZK4XFpp++zSNe6p3QV
 RoJSJtOVEoSMfdnumBdYj/gtrvIe+kG6e6wA7EJD2NTMwra5mpC4RPS729FY1NZZ1ABZ
 ZiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gloWWpgIeLWye5Vz6bI3/eQqdbtxEn3w2Sp7Ws2GB4s=;
 b=GYYVFDJTOISiAVzv0RjIoDMuGJnQtcNWRVQDrxF42Pm/oiHUNAc6PBrIiGaCiMSPGV
 Zm/5UJWxAafNf2tbew4kTmMNmu0INmtQlmsyloYDJSIOArA1foJAG1xHuBMPh1i/dCh7
 F8FeHm4IpHdqD1g4lSNIHFqfTc71L8UnW6hRj+ISXtPrspx7s6mmSM9yfjs+QikF+5Ri
 0UC1XjwzaqVJLl/w1y56igGq+XiE9Oo+10JcnLjOTV6EaEBtlxTXPtnwTBh/goCNJOF0
 m4w7dPRhHz2ZTmPj5jC8qy1ou6oX6jBDA+h4LprCc0hrDD3/5O0x/N7FGtmDFnOZGahg
 Znkw==
X-Gm-Message-State: AOAM5328cWNCi/zCyG0KtQT5qeYNyMVLhydAuBQqnGjeZaUPzBiyBOLy
 6DCmlW4XCKt64D7zbQXRubvLCJyDtBgficOK+eo=
X-Google-Smtp-Source: ABdhPJydEIE3iSFs6GlJBGtQHJziTz1Q1lnbGxxj8mje26QruUz3FN4DJNcHhdRJVuybD6dVnvtN/en83T4XlppeSPU=
X-Received: by 2002:aca:ea44:: with SMTP id i65mr7681106oih.117.1600425017323; 
 Fri, 18 Sep 2020 03:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2009181157160.14717@felia>
In-Reply-To: <alpine.DEB.2.21.2009181157160.14717@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 18 Sep 2020 15:59:59 +0530
Message-ID: <CABJPP5DGpep-S5F+J=dxdhBBDp2J9wQBrJvH_Ys6uJDj3AfRRA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl investigation:
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

On Fri, Sep 18, 2020 at 3:36 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Hi Dwaipayan, hi others,
>
> I had a quick look on the NO AUTHOR SIGN OFF issues reported by
> checkpatch.pl on v5.4..v5.8 on my own small script.
>
> After collecting all the data in a tsv (no details on that tsv here):
>
> $ grep "NO_AUTHOR_SIGN_OFF" v5.4..v5.8.tsv | wc -l
> 1064
>
> $ grep "NO_AUTHOR_SIGN_OFF" v5.4..v5.8.tsv  | cut -f 7 | sort  | uniq -c |
> sort -nr | head -n 8
>     175 Missing Signed-off-by: line by nominal patch author 'Daniel Vetter <daniel.vetter@ffwll.ch>'
>     116 Missing Signed-off-by: line by nominal patch author ''
>      68 Missing Signed-off-by: line by nominal patch author 'Trond Myklebust <trondmy@gmail.com>'
>      43 Missing Signed-off-by: line by nominal patch author 'Thinh Nguyen <Thinh.Nguyen@synopsys.com>'
>      40 Missing Signed-off-by: line by nominal patch author 'Pascal van Leeuwen <pascalvanl@gmail.com>'
>      36 Missing Signed-off-by: line by nominal patch author 'Alex Maftei <amaftei@solarflare.com>'
>      31 Missing Signed-off-by: line by nominal patch author 'Valdis Kletnieks <valdis.kletnieks@vt.edu>'
>      24 Missing Signed-off-by: line by nominal patch author 'Luke Nelson <lukenels@cs.washington.edu>'
>
>
> Here a quick look at the first two:
>
>     175 Missing Signed-off-by: line by nominal patch author 'Daniel Vetter
> <daniel.vetter@ffwll.ch>'
>
> $ grep "NO_AUTHOR_SIGN_OFF" v5.4..v5.8.tsv | grep "Daniel Vetter" \
>   | cut -f 1 > commits-NO_AUTHOR_SIGN_OFF-Daniel-Vetter
> $ cat commits-NO_AUTHOR_SIGN_OFF-Daniel-Vetter | \
>   xargs git show  --format="%b" -s | \
>   grep "Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>" | \
>   wc -l
>
> So all 175 commits are of the type:
>
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> ...
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>
>
> and the second:
>
>     116 Missing Signed-off-by: line by nominal patch author ''
>
> That is probably due to not parsing the patch author with a line break.
>
>
> So, if we can find a solution for Daniel Vetter (of course, not
> hard-coding it in checkpatch.pl), e.g., by adding a .mailmap entry for him
> and making use of that in checkpatch.pl,
>
> ... and for the encoding problem, then we got around 27% of the
> NO_AUTHOR_SIGN_OFF 'problems' solved. Next, we can continue to look at the
> next few remaining ones. The longer tail of warnings are clearly warnings
> that deserve to be pointed out to newbies with a broken setup.
>
> I hope you can continue to work on a solution for this class.
>
>
> Thanks for your initial investigation,
>
> Lukas

Hi,
I think I have figured out how to fix the authors with a line break.
The checkpatch script keeps a track of the previous line in a variable
$prevline. I can use it to fix the author's initial signature. I will
send you a patch on this when it's done.

And for Daniel Vetter's issue, it will be a bit more complex i think
as checkpatch
seems to check both author's name and author's email by parsing two
strings.

At revision 10b82d5176488acee2820e5a2cf0f2ec5c3488b6,
scripts/checkpatch.pl,


line 2673:
if ($author ne '') {
if (same_email_addresses($1, $author)) {
$authorsignoff = 1;
}
}

line 1213:
sub same_email_addresses {
my ($email1, $email2) = @_;

my ($email1_name, $name1_comment, $email1_address, $comment1)
 = parse_email($email1);
my ($email2_name, $name2_comment, $email2_address, $comment2)
 = parse_email($email2);

return $email1_name eq $email2_name &&
$email1_address eq $email2_address;
}

The easiest way at this point will be to modify same_email_address
subroutine and add checks for other email addresses belonging to
the same author by loading .mailmap.
But will this make the subroutine heavy?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
