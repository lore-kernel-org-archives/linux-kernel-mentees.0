Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDEDC4727F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 13:27:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A55C20754
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 13:27:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHIJe+Lh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A55C20754
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 04DFF86A46;
	Thu,  1 Oct 2020 13:27:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hM1ehEd59YY3; Thu,  1 Oct 2020 13:27:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7AEC686A3C;
	Thu,  1 Oct 2020 13:27:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60DE4C016F;
	Thu,  1 Oct 2020 13:27:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BF69C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9141286A46
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:27:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9lF1JaH-H76Y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:27:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9D6AD86A3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:27:45 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id a2so5326637otr.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 06:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=54jWxrzqyFpoWS/nH1oxHVPT/HijFa0iC+/U3qb2j+s=;
 b=OHIJe+LhGh33epY+sAO/8r3vP3rGOJ/j6OTslVkoAM0ElWNzjB7Q9ATGftK/BuIP3+
 WQ9ZMOILZg/IKzjYXAzZl6UJ+VVxzjQhnT+IV4NOxcivbqlSoIAzHtoW75+pDGnvCdQ5
 HuN83OEpg3Edy7NhONlasFCO4zbLJ1fLJkpPS/pXcmg8zP+G2cy1Kh9ccd5kr5Cabfa2
 ury3dzdPVyMco0Rjf2qbi8jcNi/2qmN0iQI466HHYeRvPJuJn8HbMAWLAtrhNsJgw7X9
 SddcWEYo17eWl4Y5LgQZRaAuO9TF2patTqOz6+byCDf/mAKX8/+C7EGSjAHFWHXRF3o3
 MaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=54jWxrzqyFpoWS/nH1oxHVPT/HijFa0iC+/U3qb2j+s=;
 b=krxRyqQbin0b3jVZXA6rggvAAIS/OvGN3V0AGd+VjBmZJlF9fdGX+XE94bQmHLgOPx
 Spw9s/BmwD+ifUS68aHrXXbJpxau0+Tlizob4mGpb704xVZADm/x8LJYQqf6/Zns9txU
 nYe5dF4sz/qLWRe4dLUeZd5PFu8/V1mtEKIDQGDyJuBLpCusoyMfnfTv8mm0kdfpMYKf
 khzfHUy/9/r5VnZe56G5oCDNPRvNA8xrJYzQVlayKMp3Mq+OaURVsDruXwckXS4SaRmP
 QP8hC/kj/4kpIM1ZazJraSMxS2zbOA0YUy7IBZyXyynlA2Qn5ytk26ReZaNJDYUrwQIb
 K2Jg==
X-Gm-Message-State: AOAM531WGwkSaXH5B1aFYXxYHC8PuHq7t7Q/Kye0D7QowEBqYnBwax3B
 Cu51xGDrUH3bKHlzUKhE/Ptlm/iI6nQhtAxxD8g=
X-Google-Smtp-Source: ABdhPJwzewIYeVADq7evoRRe7F6mHw5AX4J4KHstv+lWgVjNEKg6KX1nUk2lHnVc87S+tabWH2pAQm102KXrtdMqwKo=
X-Received: by 2002:a05:6830:c4:: with SMTP id x4mr5183094oto.30.1601558864513; 
 Thu, 01 Oct 2020 06:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201001103314.136645-1-dwaipayanray1@gmail.com>
 <8e110121c89414ab1601071868dbcf410195a209.camel@perches.com>
In-Reply-To: <8e110121c89414ab1601071868dbcf410195a209.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 1 Oct 2020 18:57:22 +0530
Message-ID: <CABJPP5CFE3KXzMzuvVxtJt5tOg8Ye6y1V7-mqT5pqazHjVWvJw@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: fix
	multi-statement macro checks
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

On Thu, Oct 1, 2020 at 6:47 PM Joe Perches <joe@perches.com> wrote:
>
> On Thu, 2020-10-01 at 16:03 +0530, Dwaipayan Ray wrote:
> > Checkpatch.pl doesn't have a check for excluding while (...) {...}
> > blocks from MULTISTATEMENT_MACRO_USE_DO_WHILE error.
> >
> > For example, running checkpatch.pl on the file mm/access.c in the
> > kernel generates the following error:
> >
> > ERROR: Macros with complex values should be enclosed in parentheses
> > +#define copy_from_kernel_nofault_loop(dst, src, len, type, err_label)        \
> > +     while (len >= sizeof(type)) {                                   \
> > +             __get_kernel_nofault(dst, src, type, err_label);        \
> > +             dst += sizeof(type);                                    \
> > +             src += sizeof(type);                                    \
> > +             len -= sizeof(type);                                    \
> > +     }
> >
> > The error is misleading for this case. Enclosing it in parantheses
> > doesn't make any sense.
>
> OK
>
> > Checkpatch already has an exception list for such common macro types.
> > Added a new exception for while (...) {...} style blocks to the same.
> > This effectively fixed the wrong error message.
> []
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -5342,6 +5342,7 @@ sub process {
> >                           $dstat !~ /^\.$Ident\s*=/ &&                                # .foo =
> >                           $dstat !~ /^(?:\#\s*$Ident|\#\s*$Constant)\s*$/ &&          # stringification #foo
> >                           $dstat !~ /^do\s*$Constant\s*while\s*$Constant;?$/ &&       # do {...} while (...); // do {...} while (...)
> > +                         $dstat !~ /^while\s*$Constant\s*$Constant\s*$/ &&           # while (...) {...}
>
> Did you try to output $dstat for some matching cases?
> What was the $dstat value for the cases you tried?
>
>
Hi,
I did check $dstat values.

For example on file mm/maccess.c, there were two such macros:

Case 1:

$ctx:
+#define copy_from_kernel_nofault_loop(dst, src, len, type, err_label) \
+ while (len >= sizeof(type)) { \
+ __get_kernel_nofault(dst, src, type, err_label); \
+ dst += sizeof(type); \
+ src += sizeof(type); \
+ len -= sizeof(type); \
+ }

$dstat:
while 1 1

Case 2:

$ctx:
+#define copy_to_kernel_nofault_loop(dst, src, len, type, err_label) \
+ while (len >= sizeof(type)) { \
+ __put_kernel_nofault(dst, src, type, err_label); \
+ dst += sizeof(type); \
+ src += sizeof(type); \
+ len -= sizeof(type); \
+ }

$dstat:
while 1 1


Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
