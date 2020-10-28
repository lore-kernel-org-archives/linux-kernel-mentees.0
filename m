Return-Path: <SRS0=l7vb=ED=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794F6C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 16:19:31 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7A40247E5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 16:19:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJj11ciI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7A40247E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4180F2078D;
	Wed, 28 Oct 2020 16:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gK9rS5nwk0vW; Wed, 28 Oct 2020 16:19:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9114220784;
	Wed, 28 Oct 2020 16:19:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88341C088B;
	Wed, 28 Oct 2020 16:19:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B101CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 16:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 97F8D87490
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 16:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8IVxRh0EK+91
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 16:19:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 12A6587487
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 16:19:28 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id i26so3077148pgl.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 09:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P2T+UqYIS0dJpIJQMJnEZs+QxG6HSzJVQAcItzmGQHo=;
 b=cJj11ciImUo6mdr3+Xl/22tScjoA39k2QP0v07PKWaxO6yM6QUDPxx4WP2vOAGgj2y
 YuCYgDVJ+0n8E+dgzT1YClAX6Qv5oqtOaGi4uQ6ZuqrjcVYIs0eVz/CHK8mn746lJ08j
 m/qLe0U+fVKNKTOwJpde5aTabtZ7+QU1PqURsKXdufji/AG/NC1EFLgo+DKea3lVZzgH
 gjvkj6uY7c0+Zt/MH0zmuV8XxjbGLwtJssUN3tIDUH5g6RZjp85isxkyA7dmtlTtA+pB
 nw8jac3pxgq3jg8mld3hS52Fh0qa4AXjRxDGBFS5bARlfhP0hoGwCumX3jcwzuaa/r5f
 sZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P2T+UqYIS0dJpIJQMJnEZs+QxG6HSzJVQAcItzmGQHo=;
 b=EBlbj9oV4/EOmhm0v9MvgBZiesMX+9wyOcT1VktJSb8IbQnKUKB68pUGqu0egnNkjs
 gvyA1Fghgc2EfYCe3jXx8UVhyNW2kDFADfp1Jr6hW+JbQKqdEa8gVptG0eoPW6c6Dsbo
 gh3IlElmV+OyZAVPyEB90jlKt1AnebgGW2uBLtqLjQrpbUzaXcnO1ZQAUtmXJW4cdN73
 Ok90EjYpG+OUbDlgSqIjlh21lwiUMyzej6tPSPuw42dJ9nmUYUnwb3Rm43bRuPAMdS5j
 q8A88CVWLxNdHYPT9tl7Kq+l7V/upjWp8INItBlhTEL/pHgv33FlVGRhTZ8haz7tSoJg
 gizA==
X-Gm-Message-State: AOAM533v07opyKEse99qChwY1vcmnZIvLl9Po9PVe4LwbZC9kxgTEBWM
 CU2hVl7jMaYG7GPXC86vJzo=
X-Google-Smtp-Source: ABdhPJy7tmbWyrCJ4tg+ic5fvsA7QiDKUKweLzvawrrS8ObLrP7Z/LS7DQXzyvtqdQNB/JrKyq5pJQ==
X-Received: by 2002:a65:680c:: with SMTP id l12mr166846pgt.118.1603901967410; 
 Wed, 28 Oct 2020 09:19:27 -0700 (PDT)
Received: from ?IPv6:2402:3a80:41e:761b:9145:f028:1ed9:d699?
 ([2402:3a80:41e:761b:9145:f028:1ed9:d699])
 by smtp.gmail.com with ESMTPSA id h4sm5874101pgc.13.2020.10.28.09.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 09:19:26 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <f5a91092-8bb2-5cae-6911-3f1d4150d627@gmail.com>
 <CAKXUXMzVn8qe7wOmo==r2z74X7VnhFnOpAdAUtJJcRNr==9Wog@mail.gmail.com>
 <3180d302-0b26-3bbb-4e7a-b19037a95ff1@gmail.com>
 <f6539e89-bb5f-d706-99e2-1f8577889cdc@gmail.com>
 <f9526bbd-edc9-8367-346c-f6b29f2c63a9@gmail.com>
 <CAKXUXMyuLhmCwR8rK-Nw2L3__5gXFcDn86fVMEz--b3Nizqa-g@mail.gmail.com>
 <ae7f0aa5-80e6-1ae7-6763-f62791982e89@gmail.com>
 <CAKXUXMxv5Yw801ag6O-12--pmvoaY0yrqvJCAXvkjWvJ1bCtgg@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <7233c3d3-8247-95d2-f95b-c2a93556daf8@gmail.com>
Date: Wed, 28 Oct 2020 21:49:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMxv5Yw801ag6O-12--pmvoaY0yrqvJCAXvkjWvJ1bCtgg@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: Re: [Linux-kernel-mentees] Mentee Proposal Feedback
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

On 28/10/20 1:53 pm, Lukas Bulwahn wrote:
> On Wed, Oct 28, 2020 at 9:18 AM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 28/10/20 11:03 am, Lukas Bulwahn wrote:
>>>
>>> I added some comments.
>>> I suggest committing for the first three weeks to create at least five
>>> new fix features in checkpatch.pl and get those patches accepted..
>>>
>>> Maybe you can already make a list of suggestions for automatic fix
>>> features that you think are worth being implemented?
>>>
>>> What do you think?
>>>
>>> Lukas
>>>
>>
>> I agree. I'll try to be more specific on this one.
>> As I have not used this feature in past, I'd appreciate if others can
>> help me regarding more issues they faced using it. This could also
>> help me focus on more relevant issues.
>>
> 
> Look at your evaluation and think what a suitable fix could be and
> then look if that has already been implemented or not.
> If not, you have a suitable task.
> 
> 
> Lukas
> 

Thanks a lot for your suggestion sir. I have added specific tasks in
my mentorship proposal doc. Kindly have a look and give suitable feedback.

Link:
https://docs.google.com/document/d/17ojyD17ZvcQZjP77a4eChSPKcm1iP7u_p_xmRWam1ek/edit?usp=sharing

Thank You
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
