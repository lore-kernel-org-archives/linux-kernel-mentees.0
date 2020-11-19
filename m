Return-Path: <SRS0=/60u=EZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2085C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Nov 2020 08:15:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A6BF246AD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Nov 2020 08:15:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhoCe/ib"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A6BF246AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CD4C687397;
	Thu, 19 Nov 2020 08:15:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VeLaJA5elY+d; Thu, 19 Nov 2020 08:15:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6D1A98729A;
	Thu, 19 Nov 2020 08:15:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57D68C1825;
	Thu, 19 Nov 2020 08:15:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CAC96C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 08:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B672887397
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 08:15:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TipQ7HMBtFNp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 08:15:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1F7218729A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 08:15:33 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id y18so4492368ilp.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 00:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W0xhjeMvXbpFQlM5OFx4JVtAKAqHupuW2Wv/Fr5u7g4=;
 b=GhoCe/ibUs6Do08+6lomw56mOSMpmF82FARVEOwRxZPDFDZV0dfAakDUKq+/p0kofG
 He80VdMuxGgu/R38Ar/pf/MhmHSsiBIvk+DWcopoHhWQimnXVTG7R4yDL7kVImrCYdCz
 g6W+OKyahnfredUd3z78tfmyua8BvL7AXxPOhpY5h158howqF8lnGRP1/6bk/qbEzLPG
 eo6U7IdBa7XScAQintc0bV0vJeANOoSNE5LPe6EXQ7pz+Irua7ptm3x7QHtFkWzm67IU
 EQ/OcsCVHF+LS7RS4v3YBTadzJ7KBF7hLrP0D4L5g/Q09BErNYKZgSSP6Bu4aAkfWU5E
 UE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W0xhjeMvXbpFQlM5OFx4JVtAKAqHupuW2Wv/Fr5u7g4=;
 b=uVa82yjyBzG8gWFTcWtg2bj2P22I/fxuNVpYne8OoV2inQeym4OHWyC3EiFS0O/VTq
 2LLQ9Ks2ad91iBtsOurpnZfnvqI9biBi46deLPeJCsa9/sKvhSRiZ+o9nlxKv5gjcsiZ
 d+wSLwfhO/PbxByopJVId8goeTjxjoqU9/gWvwrBMZZh1TXIeTa+9vJyYZ18z1aMu9A9
 0RF373PQfYD1CK+f038/bvN9noNlSrI/LhmfoXzYnrATe2jPtI6EW3GWn5lU4owphfoO
 zcEjBy4uIMNUoyIi+2ImZe2+qSkBag0c4YjOPgbEtWwxA/6ache9tRbXhQQ/7HRlmzL2
 N6OA==
X-Gm-Message-State: AOAM530yfzJsBA+ZDTMfJuSkkax2tLJ4iKxRuHXuOV1nzRvV2gmzbMk/
 OF+jGKBYFl8OPzRCAQuvPiw5Obz2t0Y5I7KegWY=
X-Google-Smtp-Source: ABdhPJzEZK0ikmCFXOYQ5ab9aR7hnsueDRBfZETcBosv0Gn1Q5sMYApY5T81sf74CQwtMHbT6VZeinHguiMQ5IIas5c=
X-Received: by 2002:a92:35d7:: with SMTP id c84mr13679980ilf.251.1605773732335; 
 Thu, 19 Nov 2020 00:15:32 -0800 (PST)
MIME-Version: 1.0
References: <1fa76103-e32c-0443-dde1-9ac4fc45f79a@gmail.com>
 <CAKXUXMyFRUoDortm8mozyOhNTAyqtZ4WEXzkX26Vvd9zsnPutA@mail.gmail.com>
In-Reply-To: <CAKXUXMyFRUoDortm8mozyOhNTAyqtZ4WEXzkX26Vvd9zsnPutA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 19 Nov 2020 09:15:21 +0100
Message-ID: <CAKXUXMz71tNsU-vLUtqYNiYEji48hF2EdLhdq+qvPy6Mr1sroA@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Adding doc for parse-maintainers.pl
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

On Wed, Nov 18, 2020 at 8:12 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
>
> On Mi., 18. Nov. 2020 at 19:02, Aditya <yashsri421@gmail.com> wrote:
>>
>> Hi Sir
>> So, I tried finding doc where to add documentation for
>> parse-maintainers.pl and MAINTAINERS.
>> I think the only place we have documentation related to MAINTAINERS is
>> here:
>> https://www.kernel.org/doc/html/latest/process/maintainers.html
>>
>> Or https://www.kernel.org/doc/linux/MAINTAINERS
>>
>> Maybe we should add the changes at the end of this section:
>> https://www.kernel.org/doc/html/latest/process/maintainers.html#descriptions-of-section-entries-and-preferred-order
>>

I hope you did realize that the two pages:

https://www.kernel.org/doc/html/latest/process/maintainers.html
https://www.kernel.org/doc/linux/MAINTAINERS

come from the same source file, it is simply the MAINTAINERS file in
the root directory of the git repository that is then processed and
placed to those locations above.

So, you only need to modify MAINTAINERS and send a patch.

I suggest you write up and summarize what parse-maintainers does.

>> ie at the end of "Descriptions of section entries and preferred
>> order", something like: You can achieve this desired order using
>> /scripts/parse-maintainers.pl
>>
>>
>> What do you think/suggest?
>
>
> That is good.
>
> We can more documentation on parse-maintainers in a new separate page.
>
> Lukas
>
>>
>> --
>> Thanks
>> Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
