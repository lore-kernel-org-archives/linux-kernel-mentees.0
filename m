Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF4D85C5E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Feb 2024 18:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708540025; cv=none; b=aHpcrq3dhCduTQC/XMFEipS6ShH07W8hxP0eOLc+9Eo37vqKFr6diwPxEwCS41pjY6bkkN0B5p3Qta5S6P4Pi+rX5Vg6yJAmPoQEcbMO1JzeXzzE0jyytbxfJvZCsvdIu4NcBAD6s9FwKQnQrB29YtxOv8JXCkiksik6z3F/gGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708540025; c=relaxed/simple;
	bh=6VC1qcHGtWcfwYOSabJJ8ZSmJ/99a6jDL4crh0KLPVk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=asjZHMGlXtS5Y/hDgOiBLR3kScLLmlS7qorQwCCJTfgHcesGA+fWbHsOuqMIWn/qMki46UD/nWa1vVJDQc5+hsp8TtephhgZot/6p/OEqiJ+qpOKVivB9C/VVHopYyQq23fWC4kl1IOQ3RgjsoI8RnzR6BvTvGKp4TjK3dQCuKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Im7AT0YG; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Im7AT0YG"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 860FC41570
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Feb 2024 18:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9bxTkjJdUGZr
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 21 Feb 2024 18:27:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CBEFE40679
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBEFE40679
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Im7AT0YG
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CBEFE40679
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Feb 2024 18:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708540021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oEojIl750TYVuyYtzldN9G7sEW6mfeIF1z8MGEw+SFo=;
	b=Im7AT0YGBHxZk5o0w/ZWYkxkljVOjgwyidwxR2FydygDfFekdGJ9/BpSDp2VQCU2w8gzvq
	ZeEVno5f2583h1KTUrGKBzjI/cYLyiNvV83mCeX2sUgTYDdPwX2BafBmNm9eeUWDrF33hd
	n8mGUCysHq+HyXxQhZXUL3vAaaMviiw=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-nR4LvpTyOpi8JR3WI2H5fA-1; Wed, 21 Feb 2024 13:26:59 -0500
X-MC-Unique: nR4LvpTyOpi8JR3WI2H5fA-1
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-7d8e7631457so4081760241.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Feb 2024 10:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708540019; x=1709144819;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oEojIl750TYVuyYtzldN9G7sEW6mfeIF1z8MGEw+SFo=;
        b=av0BOCH7T5oV66ffrE6C3TSJsrhtDI3ZhtgWc2zV0RMxhwYCN+tQMSnwOaIp/1qZXL
         gYCV0ctT5tAMz0lb857jwmeiMmrgKfFcAULG2oCawY+rwv7cXoiBvfDivNEHaFNuwM9u
         U+I4PZPKazDHSjwZMsi49QqiIISqD5Wqm6Z9R+1qQZ8KyxoQ5fin2M0EwEKr50jB9YIk
         cNUOTRAFKccQ+D8uh39sgGhQeu/A3PDt9GvhP3o8TF58UQXOdpsqOnqJL6XmsPBqxMYc
         McWLfkk1u/Q0F5/yV4yTAHDJIeqhpdGU7CR8HltpQOzpJsqQ7uZL3NlPgWuvVe0SAtKl
         mc3w==
X-Forwarded-Encrypted: i=1; AJvYcCUv1dxylBP6ZDQjBxoYTbbqfZSe3hsSg6t3N3iFaxucFizU+QEMN+7OCznfPEGsZoVMH9vceMpGZtuij+WXB+WpNDASm/ZlhP9VOQnaaCAu/fx/ybRqVLhK6a5QdoQd
X-Gm-Message-State: AOJu0Yx3Hlgf2ffJrW4jeyDEJeHSrJaGUr0VccxSqzd9zNUHp1DWjTq7
	XN4tECXrLW00N8/3FuLmNYegTI6o/HKX4Jzdcgr9JjtMgsxZm645aVjvIOLKzDEXh5aHvnhWLax
	w86KjqwBesjfuxpUAdBDeFuVkIHPSjjlLloHRgJKe3Sh9AMOVlJvwJHUHXlUbxXZ3RJCZXgtaNF
	ACqpW45rox5w==
X-Received: by 2002:a05:6122:4f05:b0:4d1:34a1:c887 with SMTP id gh5-20020a0561224f0500b004d134a1c887mr3318942vkb.9.1708540019324;
        Wed, 21 Feb 2024 10:26:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVeAkg3MpsRAS/vobA8hq7pIispK+lnPkq/9Wp7nPrxR6fPAfqKmvjqwfiX/cWcrVq6/8GSQ==
X-Received: by 2002:a05:6122:4f05:b0:4d1:34a1:c887 with SMTP id gh5-20020a0561224f0500b004d134a1c887mr3318929vkb.9.1708540018987;
        Wed, 21 Feb 2024 10:26:58 -0800 (PST)
Received: from [192.168.1.35] (pool-68-160-135-240.bstnma.fios.verizon.net. [68.160.135.240])
        by smtp.gmail.com with ESMTPSA id ny13-20020a056214398d00b006862b537412sm5803551qvb.123.2024.02.21.10.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 10:26:58 -0800 (PST)
Message-ID: <88672d5a-1b12-a6f2-bf7b-8670eeddc711@redhat.com>
Date: Wed, 21 Feb 2024 13:26:57 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Nicolai Stange <nstange@suse.de>,
 Shresth Prasad <shresthprasad7@gmail.com>
Cc: zhangwarden@gmail.com, jikos@kernel.org, jpoimboe@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 live-patching@vger.kernel.org, mbenes@suse.cz, mpdesouza@suse.com,
 pmladek@suse.com, shuah@kernel.org, skhan@linuxfoundation.org
References: <ff1078b2-447d-4ae7-8287-d0affd23588d@gmail.com>
 <22981.124022107441100115@us-mta-655.us.mimecast.lan>
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH] Fix implicit cast warning in test_klp_state.c
In-Reply-To: <22981.124022107441100115@us-mta-655.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/21/24 07:44, Nicolai Stange wrote:
> Shresth Prasad <shresthprasad7@gmail.com> writes:
> 
>> I checked the source code and yes I am on the latest Linux next repo.
>>
>> Here's the warning:
>> /home/shresthp/dev/linux_work/linux_next/tools/testing/selftests/livepatch/test_modules/test_klp_state.c:38:24: warning: assignment to ‘struct klp_state *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
>>    38 |         loglevel_state = klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
>>       |                        ^
> 
> 
> Is the declaration of klp_get_state() visible at that point, i.e. is
> there perhaps any warning about missing declarations above that?
> 
> Otherwise C rules would default to assume an 'int' return type.
> 

This is an interesting clue.  I thought I might be able to reproduce the
build error by modifying include/livepatch.h and running `make -j15 -C
tools/testing/selftests/livepatch` ... but that seemed to work fine on
my system.  I even removed the entire include/ subdir from my tree and
it still built the test module.  Huh?

Then I moved /lib/modules/$(uname -r)/build out of the way and saw that
the compilation failed.  Ah hah -- that's right, it's using the system
build tree.  That version of livepatch.h may have a missing or
completely different definition of klp_get_state().

How does this sequence work for you, Shresth:

  # Verify that kernel livepatching is turned on
  $ grep LIVEPATCH .config
  CONFIG_HAVE_LIVEPATCH=y
  CONFIG_LIVEPATCH=y

  # Build linux-next kernel tree and then the livepatch selftests,
  # pointing KDIR to this tree
  $ make -j$(nproc) vmlinux && \
    make -j$(nproc) KDIR=$(pwd) -C tools/testing/selftests/livepatch

-- 
Joe

