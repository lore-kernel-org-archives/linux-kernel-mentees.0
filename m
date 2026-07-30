Received: from va-2-16.ptr.blmpb.com (va-2-16.ptr.blmpb.com [209.127.231.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D993ACA59
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 30 Jul 2026 08:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398994; cv=none; b=S7tzwkK++fh42aBuU8j7FOuCD8hitWyKH52SxI9vODm13JQuafP5Mlkg1PQmaxK5ndJlvRG5+/2UhcBtF4uBzM6QksVsEWWE9pxfO4PB6n997VSxOtyvoqbIE+0wd6D0O63sQl/QUbBDSwqUpm4dh2cdBsiVSX8FRf/GdrumznM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398994; c=relaxed/simple;
	bh=tNtlNmD8778HAJnomsTuab9VT5GlxXHI2KMVKTR71mM=;
	h=Cc:From:Subject:Message-Id:In-Reply-To:References:Date:
	 Content-Type:To:Mime-Version; b=G9liLdRBqOuKp7YNeGh+r2GgwVz6ERNEB7a8rAxkY3wSmXF5ExOd430gyFw/Ih3OpLBbKDO8tDvvYB3dvRxqbxsnPum66km5uvRgPBogifzf6Mcaz8sbxAb/PH33cdqHcB6g7Q/wriDy2YHwhGvdV/i9IrqsBy6ak1/hMdI9u3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io; spf=pass smtp.mailfrom=fygo.io; dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b=VN3nx/E1; arc=none smtp.client-ip=209.127.231.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b="VN3nx/E1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1785398978;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=9a9qlKheM41V9tVOAOi1sJuzaAGCmycW+IKJ5deOY98=;
 b=VN3nx/E1IDGRHkNtoXHfya9VUZn1rB8R6ppn0F73VrinOYZRy6o8rhP0Bd963pi9DFieR4
 1Hj+4lNTNU8P233EOGS1uEduhMxHgecKKpgdUUyCW0PMpmTB7X74efqYmGI6Wg3+/2xPtX
 Qjta94Yy3AeW6uKGG9b8HBUJKXLCZInFQoaFafzW0AO8gpt5zwSHJ0PEoC6qdDYpDlKI66
 rTDOjZaLRjHvUt976Ao+MpTeJnvCLISvXXucDf+QKXbuWqW+FbUTcddxNxWVULwwWh5ts1
 im5UMq9U8NsAoU2kUp+bwBdY1Q1oLVWvclvNOSbMHENd/CFnU71NhlLJZhfTmQ==
Cc: <yukuai3@huawei.com>, <tomasz.majchrzak@intel.com>, 
	<linux-kernel@vger.kernel.org>, <error27@gmail.com>, 
	<skhan@linuxfoundation.org>, <me@brighamcampbell.com>, 
	<linux-kernel-mentees@lists.linux.dev>
From: "yu kuai" <yukuai@fygo.io>
Subject: Re: [PATCH v2] md/raid5-ppl: fix use-after-free in ppl_do_flush()
Message-Id: <acacbf2b-8f1f-4568-9246-12d9d8afd0f0@fygo.io>
X-Original-From: yu kuai <yukuai@fygo.io>
In-Reply-To: <20260622142146.56637-1-sajal2005gupta@gmail.com>
References: <20260622142146.56637-1-sajal2005gupta@gmail.com>
Reply-To: yukuai@fygo.io
Date: Thu, 30 Jul 2026 16:09:34 +0800
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Lms-Return-Path: <lba+26a6b06c2+6e09d5+lists.linux.dev+yukuai@fygo.io>
To: "Sajal Gupta" <sajal2005gupta@gmail.com>, <linux-raid@vger.kernel.org>, 
	<song@kernel.org>, "yu kuai" <yukuai@fygo.io>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
Received: from [192.168.1.104] ([39.182.0.181]) by smtp.larksuite.com with ESMTPS; Thu, 30 Jul 2026 08:09:38 +0000

=E5=9C=A8 2026/6/22 22:06, Sajal Gupta =E5=86=99=E9=81=93:

> The loop in ppl_do_flush() continues iterating after calling
> ppl_io_unit_finished(), touching io->pending_flushes and leading to a
> use-after-free.
>
> Add a break statement to stop the loop once io is freed.
>
> Fixes: 1532d9e87e8b ("raid5-ppl: PPL support for disks with write-back ca=
che enabled")
> Reported-by: Dan Carpenter<error27@gmail.com>
> Closes:https://lore.kernel.org/all/ajJF2wKYWRk4GGCK@stanley.mountain/
> Signed-off-by: Sajal Gupta<sajal2005gupta@gmail.com>
> ---
> Compile tested only.
>
> Changes in v2:
>   - drop the refcount_t conversion
>
> v1:https://lore.kernel.org/all/20260622080656.22786-1-sajal2005gupta@gmai=
l.com/
>
>   drivers/md/raid5-ppl.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
Applied to md-7.3

--=20
Thanks,
Kuai
