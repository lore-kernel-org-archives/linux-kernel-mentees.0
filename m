Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6701FC88CB9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Aug 2023 02:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9B9F834B9;
	Fri, 25 Aug 2023 02:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9B9F834B9
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KH+lMhzI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WBEbhqruECru; Fri, 25 Aug 2023 02:05:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C48F18343B;
	Fri, 25 Aug 2023 02:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C48F18343B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B963C0039;
	Fri, 25 Aug 2023 02:05:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 955D0C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 02:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FA5860BD8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 02:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FA5860BD8
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=KH+lMhzI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D7HdF1A_1JP5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 02:05:48 +0000 (UTC)
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 188F360BD4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 02:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 188F360BD4
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-573249e73f8so338307eaf.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 19:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692929147; x=1693533947;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tV/xhMrG27pnQQdfeNDXAs9vebCS+5kkS2KT1sSOa80=;
 b=KH+lMhzI7jZ8rYptdhcbSfZQ8+HBsGRJd77yQHDq+BXrhGxqXTWKXOH3kGZYuze8qe
 kfvFFx5SyWefbAqyqUbeBn4VDBIuPTMnTciUaWuBxik1CZwCXnLbghczQs+n/YOMn5Sa
 2mto9NZOBxN5C8qUM1C3b4o8qeN/WKzVjdG+Ez9ViVkD2OhfZfZ0iiejDsSBwxwMtAbj
 P9VBABTUkDMnw+ZFBjEkHdNoqW2AOlIBc8bFXuyakMoVN2RIxbYplmnGe6i+PmeEPwcn
 6KjSkifdhykk/A1XmBBLQzc49QwW+jMEeeEv+1Oj5YCTj9FgUWmTPTpA3DqV2PwZBSLe
 OdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692929147; x=1693533947;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tV/xhMrG27pnQQdfeNDXAs9vebCS+5kkS2KT1sSOa80=;
 b=S+HBz4jOvQ+JTv+Apr8O3Hw2xTO/FE4w+nZDZ/i/r0pQ5cbTAqyEnJaEUvbY0szgvm
 QbBsixHUPRmNJK/tCaNOQfMyxvJmcZD0BOKpBzWMiWeL4jXLfC/2pGdu7XRswijNBHqm
 qiUsGobvpUbqDkh8toHw0xaPrtI35BJ25yxkQ6ODykOq5IIyPx/NiCS5UUooTpxh8pxb
 BMq2CTPB6M3+SBqaeGuUqt0CKAX609hgqi+0NJCuFOcZubVocup7M7aPDB9fhzhM7FzN
 01bYNoQS0T8TAydsDiPtF2cB8TWyZgsdzr80rrVKwrm1RMw04dWvO9GlUiIkhQOSiSon
 WPbg==
X-Gm-Message-State: AOJu0YxtrF3oyBYllRU3t86haZ/HYe4yveqA6f1f0vHhNhp5Od+8T7fJ
 N8DjsZ9aXHfgR9Si8ypBWx4=
X-Google-Smtp-Source: AGHT+IFwVVg6YiTFk8zpBOPVx1N8fV+8AvVZxuYh+26ryVBhH9WMkI0PDKDJBRCuMeaUJ5VlITHA5w==
X-Received: by 2002:a05:6870:5620:b0:1bb:583a:db4a with SMTP id
 m32-20020a056870562000b001bb583adb4amr1678722oao.44.1692929147043; 
 Thu, 24 Aug 2023 19:05:47 -0700 (PDT)
Received: from rajgad ([2601:204:df00:9cd0:5aa8:2901:89a5:c04b])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a17090ace0600b00267ee71f463sm3461672pju.0.2023.08.24.19.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 19:05:46 -0700 (PDT)
Date: Thu, 24 Aug 2023 19:05:45 -0700
From: Atul Raut <rauji.raut@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: pagevec: Fix array-index-out-of-bounds error
Message-ID: <20230825020545.bfpxs6uq4qdvrv5x@rajgad>
References: <20230825001720.19101-1-rauji.raut@gmail.com>
 <ZOgKTO612u1Fn7PB@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZOgKTO612u1Fn7PB@casper.infradead.org>
Cc: linux-fsdevel@vger.kernel.org,
 syzbot+e295147e14b474e4ad70@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============1607033618761807315=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============1607033618761807315==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sve3wn3ghdf5u6b7"
Content-Disposition: inline


--sve3wn3ghdf5u6b7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Matthew,

Thank you for your reply, agree with you its seems wrong fix,
will take a look at it.

-Atul=20

On Fri, Aug 25, 2023 at 02:56:28AM +0100, Matthew Wilcox wrote:
>On Thu, Aug 24, 2023 at 05:17:21PM -0700, Atul Raut wrote:
>>  ntfs_evict_inode+0x20/0x48 fs/ntfs3/inode.c:1790
>
>No.  This is your clue.  ntfs corrupts memory.  You can't take bug
>reports involving ntfs seriously.  Ignore everything tagged with ntfs.
>
>> In folio_batch_add, which contains folios rather
>> than fixed-size pages, there is a chance that the
>> array index will fall outside of bounds.
>> Before adding folios, examine the available space to fix.
>
>This is definitely the wrong fix.
>
>>  static inline unsigned folio_batch_add(struct folio_batch *fbatch,
>>  		struct folio *folio)
>>  {
>> -	fbatch->folios[fbatch->nr++] =3D folio;
>> +	if (folio_batch_space(fbatch))
>> +		fbatch->folios[fbatch->nr++] =3D folio;
>
>Did you look at what folio_batch_space() actually does?
>
>static inline unsigned int folio_batch_space(struct folio_batch *fbatch)
>{
>        return PAGEVEC_SIZE - fbatch->nr;
>}
>
>So if fbatch->nr is 255, what will it return?  How will
>folio_batch_add() behave?
>
>The right way to fix this problem is to find the data corrupter in NTFS.
>You can't "fix" it anywhere else.

--sve3wn3ghdf5u6b7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEk+Uz5/8aTg0U2TbgUdAfNFxksqcFAmToDHUACgkQUdAfNFxk
sqdPngv+NCUU657tLXSWvPgVhINaEPNau3DK7gKbAEj67weSHu/YUAavgo04fDrg
nD6ND6gskKrHaOF8uxzaybB49a5d4E4Mp5JTQCJ8D/3771GijyX+PgauDZBAtPsF
r0PJOc9Gh//OFIQmtxp9COzxL219LBnJysQ7lBxwYJ3/oiO4yvvNwgeIEv1U+L29
MLoKrFiMc7CGp5NmzPAGc5Fl+OuKF96NgkDW/8ZUvkLp80fkOg+egdqwTFLRJ9Ok
lqYQrqAQngQhQS3siWFjUR7UNcsOsq6Aj+22MPTAc5VijUFEVW3+0u8npE7g3uoo
+4J/Ip9WZzNvpIetdwrWgSbi61dGezJv5AfxC5zXwQXz3jtC9Hu3ip8f+Xune9pD
It7225RCOz4A5R/jjWSSpBlmvOUB/+T7BD3PLa3Hpa5x/cb+x2gs/bAGc+7bTsi2
pIwRqG9I4vHbXSY2eJDUXFeaTBDnLMEgur6nmr5TWNtUt7Cw/4qcPtrfpyMmtsfc
BlipfPA/
=Bi8j
-----END PGP SIGNATURE-----

--sve3wn3ghdf5u6b7--

--===============1607033618761807315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1607033618761807315==--
