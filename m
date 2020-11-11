Return-Path: <SRS0=RhO4=ER=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED27AC5517A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 20:05:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30001207F7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 20:05:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geVQq6Xr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30001207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 953D8859BA;
	Wed, 11 Nov 2020 20:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bbyYexuPbfal; Wed, 11 Nov 2020 20:05:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2F22E85CD0;
	Wed, 11 Nov 2020 20:05:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08EF4C088B;
	Wed, 11 Nov 2020 20:05:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB734C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 20:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D1FC685CD0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 20:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CR-shJ8rNpuu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 20:05:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 34CD6859BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 20:05:06 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id x20so3103797ilj.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 12:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ac9OqmxUzP8F/RyWFpWdM4QdIVCjTljvfElYCIcqaao=;
 b=geVQq6XrwpbhlEgKdMK1TPeEOUqTiQaG71wQ86aAE6NvzxQfFRBW55BAnlGNC5y7xZ
 p0Ke/I3UMcLKCZ16JjH4DvtgFbyUfYRy2YxQnHbL5sH/Kq7x+D3wn9E4dFaiOWgSlgLx
 oC/ba2VuyOxJaOBDlcNHysGbZF2wz7HTVlwad6qIfXHZU0TZsD+IQJoVMdzx+DhyQx6p
 Gn2Ef3o/fErC0qjrPI/lSiNx3j4JwQyL0qCZT2+iO5oJ6g8JhwYTLa4KbhAB7mYu0tvr
 6tz4lF/oAkhlJo8Y4pj5T4GQ1ImqN6b0cB2vxTtS3JDOGNBTp4n9+fWd3oYamoAtAABQ
 k6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ac9OqmxUzP8F/RyWFpWdM4QdIVCjTljvfElYCIcqaao=;
 b=g+UjJbf/Xukr8h1P8sEDwqMsWMZwSjNi2CTxhVRzVWnWWMbHCXX+cr5u7brXIMWAe1
 YCvKvfbJtNF1Qx0Dncn4SH2WNQkvf1TIAKw6PWdJ2C3eI/RUnAfrE2jyC3j4rib+ShEd
 rN9Z/FmtPAEU1ezDPE2LC+rVAi77gE9AQYbw+gbLvAZDMOD6fsQoMLQ3iWQwwj5nisGP
 63jR7xYtvYse+t8dboeQI6A/0s1tvV4SukLUsGChjAj9Z+/awqkZ69skuhyqKjLLK42+
 X2ECokWYsxMKaC5rzmGiK8mhqlLE4/NP3Ly6D6uIyj5ylNEQKKebYWuM6mUUpCM1dvRN
 Q05Q==
X-Gm-Message-State: AOAM533W/U1R11vhADdVJJNvJ+rVBP1o1WSFbDGqRspkPUjr5DiRsbt8
 tGlzlxRlwDk9euMQLmZvPffASV1QINpLeSOYs4E=
X-Google-Smtp-Source: ABdhPJxHVpANxtnDEgF8U4VtA0eaPehSXGm8j4zZ8tGN5niFjc+xiAaacdrhK0UAVbkuZB90p/XbOkY7dHOjv1kMkdo=
X-Received: by 2002:a92:35c7:: with SMTP id c68mr20456304ilf.251.1605125105242; 
 Wed, 11 Nov 2020 12:05:05 -0800 (PST)
MIME-Version: 1.0
References: <50c8be3c-fceb-255b-43ba-1ce8284ab410@gmail.com>
In-Reply-To: <50c8be3c-fceb-255b-43ba-1ce8284ab410@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 11 Nov 2020 21:04:56 +0100
Message-ID: <CAKXUXMw2=4E8XpZFx04pkBmvwDSpcCedxE2ndX4DX5DTek_06g@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Fix for BAD_SIGN_OFF: non-standard
	signature
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

On Wed, Nov 11, 2020 at 3:13 PM Aditya <yashsri421@gmail.com> wrote:
>
> Hi Sir
> I have analyzed the checkpatch report for BAD_SIGN_OFF(over
> v4.13..v5.8) for non-standard signature and generated reports for it.
> Some mistakes are more frequent than others, whereas some mistakes
> even have a frequency of 1.
>
> Non-standard signatures occurring with their frequency:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt
>
> Complete warning messages:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/warn_msgs.txt
>
> Should I implement the fix similar to TYPO_FIX, where we have a
> separate file for common misspellings and corrected words? Or should I
> make a hash of these misspellings in checkpatch.pl file as well?
>
> Also should I include all these misspelled words in it? Or omit words
> below certain frequency?
>

I think the best way would be to compute some kind of edit distance to
the known signature tags and if this edit distance is below a certain
threshold, suggest that signature tag as the fix. We can then evaluate
to determine the best suitable threshold. The edit distance between
the different tags are so large that this should always work as
intended.

Then, we can look into these other creative tags and propose suitable
existing tags for the more frequent ones that are non-standard. Or in
the case, none of the existing ones fit we can start the discussion on
proposing some new standard ones.

Lukas

> Thanks
> Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
