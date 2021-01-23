Return-Path: <SRS0=Gcau=G2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E33C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jan 2021 03:14:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DDD023B17
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jan 2021 03:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DDD023B17
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2C71B86A94;
	Sat, 23 Jan 2021 03:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0-YL2gWwLcO7; Sat, 23 Jan 2021 03:14:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2A39C85507;
	Sat, 23 Jan 2021 03:14:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E72DC08A1;
	Sat, 23 Jan 2021 03:14:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1CE42C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 03:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0AAC686E11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 03:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wyN89BuAE3ll
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 03:14:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8C99D86D91
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 03:14:34 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id z22so15352934ioh.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 19:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w8AeyHpQR2OtcyJPQ1rBdmP0/lJq7Gmr8Uvs7OZwEho=;
 b=cSIU8MfSV6X0Qz7rFim41XV3YxaujfjRJstYs4FLshnbnPoaeXtaK2TpJGJ2RfrETQ
 4AWTTZY4cs1EQ2tvplD3d7UCIivD32D7FERuDRHCXJ36tDdT1wjX6t7n8K8AQbWOB/aO
 pavwuBTat1WwNMppHCj+B79gynYPOrFZ2LDSY07H8yNWr5WUk/TysGtGk6cec6bf3Nr6
 tNefvCezQ7jGzvDh+IyHfe7raxN0OaIrPLAVP3u4+zE7pleTnFShK0SPTPRhTIDfrZ2j
 clyvvRhwQMthaiWnGc5D8BI7jh9Ue5yx+qtgYHWXSubWPDNZSajHVh/hHlHXCz22d6+v
 AARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w8AeyHpQR2OtcyJPQ1rBdmP0/lJq7Gmr8Uvs7OZwEho=;
 b=CwXUqU+E3gA47/JMO4alNdePZelpmzs7i1CuU/kWFWLnkGmPa7H/XgbL4t6bLCZaIm
 +SNlkq5y/2hrxW86Ktw54i+3S+XKCLmw+WKaoGjZIarK7KXalkiOeKiU4N2oMNpCl43c
 Ilu8NRkf9qnC1sNWP9UXcNaJQnrrEd6erFhFpnseKjMGf5UnRMjGXgvvZaVY24bz/rZC
 KDBQfuBLtCnUeUwOyys1xJ1fJKhsoSwLuCj8nmqL49xEkoNNGF3hGZJqzbUDcTjm5qM3
 MCE/wTjJ/BxrCZMbeP2g4bhqqxCS06htRdw9+fEPIV6+3PJ8mjF3L3mcoQYiF710NvZh
 H6Ew==
X-Gm-Message-State: AOAM533azer799/UuJjXUfooDRoppJY0TNMEpzG2uK3nY/E+ayY8cmh1
 13oFFL5O1ssjKFgfMW2c6UING2lZXL4P03QkSTE=
X-Google-Smtp-Source: ABdhPJy2hP+Ls09Cvt3jajmDkIp0KL01/ahiHE06pi01dv1O2A9CUlVpeoZZ7idvRjVS/NFcJUhrBWGEDXOPVdCQZLs=
X-Received: by 2002:a5d:97d3:: with SMTP id k19mr84011ios.102.1611371673733;
 Fri, 22 Jan 2021 19:14:33 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5DZH0=kr6JaE0wv4iC+pq-9YG=SLPE_15jiQ1YnW1_1rg@mail.gmail.com>
In-Reply-To: <CABJPP5DZH0=kr6JaE0wv4iC+pq-9YG=SLPE_15jiQ1YnW1_1rg@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 23 Jan 2021 04:14:23 +0100
Message-ID: <CAKXUXMz06TQmbeeugD0F0n6+ESYM6bNOi2oVw4Q7d_8qBh3D+w@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Addition of verbose mode to checkpatch
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

On Fri, Jan 22, 2021 at 10:27 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Hi Lukas and all,
> Recently while going through the warnings emitted by checkpatch,
> the necessity of a verbose mode came up once again. Joe had
> already suggested that a verbose mode would probably be worked
> on.
>
> As for how that could be done, that leaves us at a couple of options.
> Since writing verbose messages for all warnings aren't possible at once,
> there can be an optional extension when emitting messages:
>
> Currently, a warning can be emitted by
> WARN("TYPE", "Message")
> which could be converted to say:
> WARN('TYPE", "Message", "Verbose")
>
> Another way is to leave the original warning emitting syntax intact
> and instead go for a dictionary for verbose messages:
> our %dict = (
> "TYPE1" => "Verbose",
> "TYPE2" => "Verbose"
> ...);
>
> Although this leaves us the ability to customize the verbose output
> for each warning of a particular type.
>
> Which do you think would be best? Certainly more options might be
> possible, so any new inputs will be nice as well!
>

I think any of the two approaches would work.

But how about a completely different approach?

The verbose message is really an explanation of why kernel developers
think this rule should be followed (what is the history, what does it
try to warn about, what are possible fixes, what are accepted
deviations, ...).

So, this should not be placed into the checkpatch.pl script itself,
but into Documentation.

checkpatch.pl would simply quickly parse the Documentation and present
the content for the specific rules that were violated.

Let's say this Documentation is in
./Documentation/tools/checkpatch.rst, and they contain subsections
with labels/name with the TYPE identifier. Then when a warning of TYPE
is relevant for a specific patch, you print the description from that
one subsection.

In checkpatch itself, you would only need a very generic mechanism then.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
