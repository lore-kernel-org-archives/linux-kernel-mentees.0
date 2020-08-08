Return-Path: <SRS0=UpBJ=BS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C5FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  8 Aug 2020 22:57:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5413206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  8 Aug 2020 22:57:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZU/Tvgq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5413206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B8FD488541;
	Sat,  8 Aug 2020 22:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XTZQvB9Z89aj; Sat,  8 Aug 2020 22:57:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EBDC48853D;
	Sat,  8 Aug 2020 22:57:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDCA5C013C;
	Sat,  8 Aug 2020 22:57:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E14D6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Aug 2020 22:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D0DB486F5A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Aug 2020 22:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SAeBtIoo305N
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Aug 2020 22:57:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2D5FC86B6D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Aug 2020 22:57:37 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id u10so2901511plr.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 08 Aug 2020 15:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9sPtCXARRDyoJ9gED6VcstU3ZnY0CN85dWocZ7ctG2E=;
 b=QZU/Tvgq78IUEtDcC1+6C6xvjHGuXJHXguScPFEZz+aS8foez55jwUhTUnx6KF7Il+
 M4iZheUMXLzs7xSlWXfG7H+dM0oO1GHdyFlV0iYOxUVqXT3hfmdNyhfIzRT+rq9ZVN0p
 lRJeSK58lKVj6qy80rOKm5wmcgQJxk8Egn9Qe4S2LdY9PTEFAUCSDT509S/C9+IxX6PH
 sNXvvUkN+iMb38o1tJ6uK54VtqU/ZK2fQsTq02a3T44B4e6sPjqwCS08rXMMlOJD1Akz
 yjwAl/o38v5nzut99M9Sbzr9YLxJdAPl/n+p9mtauvxWllfoTls6vC9FiQQ+0wzanl/6
 Aeyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9sPtCXARRDyoJ9gED6VcstU3ZnY0CN85dWocZ7ctG2E=;
 b=QLVzvyr0E+McWov/9VxlEaVuqYEqDp1+6Vevl0WGeLNgagAeUTqowcC1CWlztF9r7U
 9WjloEZAajxESk6QUL6CE0oAbwp3dO58sKVGyLjTjp63L4mw11ARRVcoDoAOpiKnumBi
 CheXWrcB2xXZoR0LM1j28dq01ttofUpvYG362QECLHjEiX4oj8yd8Po9FRmj9Bgjw+Ze
 4rffDthcmxbWMH/pn5XlX3DXHdYrYezblN2s/H6MNxRrVQmlnCjXryHV8UOHzg7PUs8y
 vLn5ZPN3A8SAD9+OQEaPRDcdq0xa6KvWyr/kVv06EyWmksI7xiVJvdhx5oI1p0O0YcrS
 Q7xw==
X-Gm-Message-State: AOAM533cNQMlzt/7+gd0Nk+Au363B1OzPOXxeCfo49R1yFkzIcGH+ifz
 mn3P6sLtZzxzOP9R1c2SU8w=
X-Google-Smtp-Source: ABdhPJxC1hb5eucKSMPhCKqbRKPCMGw/TpygTR/MPLb0wTD4LcgT7LTAWUFr7XtyF2eqj7hNOfB1oQ==
X-Received: by 2002:a17:90a:d482:: with SMTP id
 s2mr19980811pju.140.1596927456678; 
 Sat, 08 Aug 2020 15:57:36 -0700 (PDT)
Received: from [100.115.92.198] (18.48.24.136.in-addr.arpa. [136.24.48.18])
 by smtp.gmail.com with ESMTPSA id y17sm17167551pfe.30.2020.08.08.15.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Aug 2020 15:57:36 -0700 (PDT)
To: Jason Gunthorpe <jgg@ziepe.ca>, Joe Perches <joe@perches.com>
References: <20200731053333.GB466103@kroah.com>
 <20200731140452.GE24045@ziepe.ca> <20200731142148.GA1718799@kroah.com>
 <20200731143604.GF24045@ziepe.ca> <20200731171924.GA2014207@kroah.com>
 <20200801053833.GK75549@unreal> <20200802221020.GN24045@ziepe.ca>
 <fb7ec4d4ed78e6ae7fa6c04abb24d1c00dc2b0f7.camel@perches.com>
 <20200802222843.GP24045@ziepe.ca>
 <60584f4c0303106b42463ddcfb108ec4a1f0b705.camel@perches.com>
 <20200803230627.GQ24045@ziepe.ca>
From: Jack Leadford <leadford.jack@gmail.com>
Message-ID: <ff066616-3bb8-b6c8-d329-7de5ab8ee982@gmail.com>
Date: Sat, 8 Aug 2020 15:57:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200803230627.GQ24045@ziepe.ca>
Content-Language: en-US
Cc: rds-devel@oss.oracle.com, Arnd Bergmann <arnd@arndb.de>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net] rds: Prevent kernel-infoleak
 in rds_notify_queue_get()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hello!

Thanks to Jason for getting this conversation back on track.

Yes: in general, {} or a partial initializer /will/ zero padding bits.

However, there is a bug in some versions of GCC where {} will /not/ zero
padding bits; actually, Jason's test program in this mail 
https://lore.kernel.org/lkml/20200731143604.GF24045@ziepe.ca/
has the right ingredients to trigger the bug, but the GCC
versions used are outside of the bug window. :)

For more details on these cases and more (including said GCC bug), see 
my paper at:

https://www.nccgroup.com/us/about-us/newsroom-and-events/blog/2019/october/padding-the-struct-how-a-compiler-optimization-can-disclose-stack-memory/

Hopefully this paper can serve as a helpful reference when these cases 
are encountered in the kernel.

Thank you.

Jack Leadford

On 8/3/20 4:06 PM, Jason Gunthorpe wrote:
> On Sun, Aug 02, 2020 at 03:45:40PM -0700, Joe Perches wrote:
>> On Sun, 2020-08-02 at 19:28 -0300, Jason Gunthorpe wrote:
>>> On Sun, Aug 02, 2020 at 03:23:58PM -0700, Joe Perches wrote:
>>>> On Sun, 2020-08-02 at 19:10 -0300, Jason Gunthorpe wrote:
>>>>> On Sat, Aug 01, 2020 at 08:38:33AM +0300, Leon Romanovsky wrote:
>>>>>
>>>>>> I'm using {} instead of {0} because of this GCC bug.
>>>>>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53119
>>>>>
>>>>> This is why the {} extension exists..
>>>>
>>>> There is no guarantee that the gcc struct initialization {}
>>>> extension also zeros padding.
>>>
>>> We just went over this. Yes there is, C11 requires it.
>>
>> c11 is not c90.  The kernel uses c90.
> 
> The kernel already relies on a lot of C11/C99 features and
> behaviors. For instance Linus just bumped the minimum compiler version
> so that C11's _Generic is usable.
> 
> Why do you think this particular part of C11 shouldn't be relied on?
> 
> Jason
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
