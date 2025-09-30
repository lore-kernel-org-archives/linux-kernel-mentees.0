Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E31B1E51E0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 10:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759227317; cv=none; b=bWSdI6FPphAKCzrLymgLvG8Nveo1FS9sdl6blc0yFSHQEHNVrHjg9+TncqU3CKBTqt0lJdyVq+cskoKDO1B6WDCLB3mN4BisKBpTGPwm3M9JgLoJYTZUL/T/O7Ww0FjfB8rMWHACFK65Al6oyG7b/th7N7H3rM0aXOGT9Qvdmdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759227317; c=relaxed/simple;
	bh=8lD6pDtxYmt50mk/QmwTdSy6OOnLGlYbh+Njk+h1+u0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jP8aaboMmOoiDnVwBCI11+MR3C4wR+g/nBPhvPGv6mer8e1nJzmfnwsd2OeVzvdWS2TZlnPKQPmKIQf6PZZkvyUSY7gHOQzYtcugg/y8x7nJtDIkstWLr4VcTyx4yjgg6ynoyqaSnRdNPG842Tid4YNKWdjamphJK7SXjqgfVQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmx.com header.i=quwenruo.btrfs@gmx.com header.b=GODUfKtH; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=quwenruo.btrfs@gmx.com header.b="GODUfKtH"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03FAE40A29
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 10:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -6.488
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XkYFxlY8oe8q for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Sep 2025 10:15:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=quwenruo.btrfs@gmx.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 990A340A1F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 990A340A1F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.com header.i=quwenruo.btrfs@gmx.com header.a=rsa-sha256 header.s=s31663417 header.b=GODUfKtH
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 990A340A1F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 10:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1759227312; x=1759832112; i=quwenruo.btrfs@gmx.com;
	bh=xAlSJAqz7B75+0z+tcwRCeT89jL6ufsQdHDrs0HJROQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=GODUfKtHNcpQZUOXWasws3OmESTI6Uxtid6bhZO+BGuNmZImGWvQFrCFu7Ye1OYF
	 3CHV3aPbvj4VYSp4rmKsRT0ltWgPBB0hWeVrB823kuAqLvQaNSTAlNAEaZKEApqpc
	 NUN0llKX3DIYm0RxqaS2YPvPpHnYYrUuu13weF7XxWz4zP6y6I5uRh5bepjVBfMdt
	 0pTQiVCdK/zox4UsvmVP34blaFAbB0zbb3doMrnvMOUMwz3A8cQyWvcgU8RuoSIfI
	 2Kmaqb6KXLbprSpqMuaT3xbrgc6yek9dBAGHTOY219MEMCdOGMd3zKVfXRIOx6dbM
	 Z6w/aC5d3OOaig9Jgw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.229] ([159.196.52.54]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MYeMj-1upZB31xR5-00QnLT; Tue, 30
 Sep 2025 12:09:54 +0200
Message-ID: <7d0f9cd6-77a5-41e1-82fd-4641d149bfda@gmx.com>
Date: Tue, 30 Sep 2025 19:39:49 +0930
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] btrfs: Refactor allocation size calculation in
 kzalloc()
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>, clm@fb.com,
 dsterba@suse.com
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
References: <20250930100508.120194-1-mehdi.benhadjkhelifa@gmail.com>
Content-Language: en-US
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1YAUJEP5a
 sQAKCRDCPZHzoSX+qF+mB/9gXu9C3BV0omDZBDWevJHxpWpOwQ8DxZEbk9b9LcrQlWdhFhyn
 xi+l5lRziV9ZGyYXp7N35a9t7GQJndMCFUWYoEa+1NCuxDs6bslfrCaGEGG/+wd6oIPb85xo
 naxnQ+SQtYLUFbU77WkUPaaIU8hH2BAfn9ZSDX9lIxheQE8ZYGGmo4wYpnN7/hSXALD7+oun
 tZljjGNT1o+/B8WVZtw/YZuCuHgZeaFdhcV2jsz7+iGb+LsqzHuznrXqbyUQgQT9kn8ZYFNW
 7tf+LNxXuwedzRag4fxtR+5GVvJ41Oh/eygp8VqiMAtnFYaSlb9sjia1Mh+m+OBFeuXjgGlG
 VvQFzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1gQUJEP5a0gAK
 CRDCPZHzoSX+qHGpB/kB8A7M7KGL5qzat+jBRoLwB0Y3Zax0QWuANVdZM3eJDlKJKJ4HKzjo
 B2Pcn4JXL2apSan2uJftaMbNQbwotvabLXkE7cPpnppnBq7iovmBw++/d8zQjLQLWInQ5kNq
 Vmi36kmq8o5c0f97QVjMryHlmSlEZ2Wwc1kURAe4lsRG2dNeAd4CAqmTw0cMIrR6R/Dpt3ma
 +8oGXJOmwWuDFKNV4G2XLKcghqrtcRf2zAGNogg3KulCykHHripG3kPKsb7fYVcSQtlt5R6v
 HZStaZBzw4PcDiaAF3pPDBd+0fIKS6BlpeNRSFG94RYrt84Qw77JWDOAZsyNfEIEE0J6LSR/
In-Reply-To: <20250930100508.120194-1-mehdi.benhadjkhelifa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SNjPcdNYY8ARF61SR9NttGgRvCgU/3HZHTRtUR8vT7zKlxcWWZs
 PvEgRvB24eC0YwnYa3kgWKb7Z9xtp/kRUmdK0OHuyNOrKLFgZrYXmqc4flfaCoI00tZHku/
 HxVmqTbF7BI5rOP1ybxR0kYHiF9gcqo8X+lmqmXx3T7ieVsmLq0Ym2iKR4q1MiejMSVorEJ
 z/XFwj9tubpOtS5Md78Nw==
UI-OutboundReport: notjunk:1;M01:P0:Hm2MZC6OkYc=;RTroxcksNbwyZno8WSz21WS7+a7
 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



=E5=9C=A8 2025/9/30 19:33, Mehdi Ben Hadj Khelifa =E5=86=99=E9=81=93:
> Wrap allocation size calculation in struct_size() to
> avoid potential overflows.

I don't think it's really about overflow or whatever, just pure code=20
refactor to make it more structured/easier to read.

You don't need to send out a v3, we can handle it at merge time.

>=20
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>

Otherwise it looks good to me.

Reviewed-by: Qu Wenruo <wqu@suse.com>

Thanks,
Qu
> ---
> Changelog:
>=20
> Changes since v1:
>=20
> -Use of struct_size() instead of size_add() and size_mul()
> Link:https://lore.kernel.org/linux-btrfs/342929a3-ac5f-4953-a763-b81c60e=
66554@gmail.com/T/#mbe2932fec1a56e7db21bc8a3d1f1271a2c1422d7
>=20
>   fs/btrfs/volumes.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
> index c6e3efd6f602..d349d0b180ac 100644
> --- a/fs/btrfs/volumes.c
> +++ b/fs/btrfs/volumes.c
> @@ -6076,12 +6076,7 @@ struct btrfs_io_context *alloc_btrfs_io_context(s=
truct btrfs_fs_info *fs_info,
>   {
>   	struct btrfs_io_context *bioc;
>  =20
> -	bioc =3D kzalloc(
> -		 /* The size of btrfs_io_context */
> -		sizeof(struct btrfs_io_context) +
> -		/* Plus the variable array for the stripes */
> -		sizeof(struct btrfs_io_stripe) * (total_stripes),
> -		GFP_NOFS);
> +	bioc =3D kzalloc(struct_size(bioc, stripes, total_stripes), GFP_NOFS);
>  =20
>   	if (!bioc)
>   		return NULL;

