Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1021A392C25
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Apr 2026 07:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776063881; cv=pass; b=g7lI+JBSE8DHXlQmcA//lGNttBnNxHrszKvopzLajFWGYGzeWQU//8Gp3nEQqmAk+VSZAtRniyN5KCNIP2p9cZZhPPXcWqqrFHKEpviHjMHusJTwPtLTDhWib6b0eKaJj1mFhdCcmOOr1o9C+sbZe5IKUtFV2adjMxpBtPvrTcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776063881; c=relaxed/simple;
	bh=cHUon7mnOsFivonubjEmKa1tqwPu0cNQ4ngoVsPKvwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYXD51WAjo+m82nQ0IY3/JUDX4oA0jHbuKM/YDkjRdnB9yMSOBQzVZmQWHOTWqg6lq1tu0AtH82QRY/rKByc4KzAEgarx2cFThWIdE69gTnXXlicOtWQJ56ajnNvhSbQG90HAIFrnIr+7g9b1BV0GfYIneTHb7K2pUCd5ShQ6Yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tlebl5by; arc=pass smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tlebl5by"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB3F642676
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Apr 2026 07:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l20umYEhbttl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Apr 2026 07:04:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C14464265E
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C14464265E
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Tlebl5by
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C14464265E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Apr 2026 07:04:38 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b8f97c626aaso629094366b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Apr 2026 00:04:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776063876; cv=none;
        d=google.com; s=arc-20240605;
        b=d9B8J4Ita7CNI6rwqPE+vubEE3soQHqywHQuqg+zhpMYfblF8gKyp2KRRKGb61OEPG
         CE9F9zExxiWHMf+s9qsOG75CesgvUwGOJkriXd/RsjYOOrDNSLf+i8fNVIe2dNvombzL
         ZI6ReDDZukpknpKPLXFwLAfsdFIaTnu165WpHqib9TrFWBQyTtI4rR8qYnJcIJGLux+Q
         MPIIn8oxRXZTCXsFGv+n0ncxX5WD0L8IXYNj8gHTvSS172vVie0gzPr2kD2lExvLJ6ac
         h8UZXQKMcjpb2UhhmOqM+Ba24DITrycnGG7F0LdL6FLxgSHFGlJXZKaHhZa5kVqMqlJ0
         1Eog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cHUon7mnOsFivonubjEmKa1tqwPu0cNQ4ngoVsPKvwA=;
        fh=Z57i1r6VlSCm0+69O97/s3ett69Xa8avsYmomUPaCxo=;
        b=eGW6plmZEVgJ3O7oGVU2by+7H7jdkCTpSSlKxYkJXKp2Vi7N7B3h1DKcxiKZQ6C2U8
         ctRqu19AuEJzWvTkHJ3EIrqDpAIkxGKO6yU13CEfw9kEYkSrs7WyfxNpB07+AofahyVW
         cbz/jnXaHzXfh8Y7BZkodf4fy8zMLsj6+OMPHsbwnyke5wA1HQ3boN7NQAKAXj4SnF16
         LDm0isXShibjavwhAndpc2511eaKK/MszpsNV6DjqV9y+INGYgUmknFaZIzT3/95b0HZ
         IxZUaL1CA7aORCobWx4W+Sc4zTLqjiVD3xRLB6eBOQwjyofxa4X1X5epx4hyi9W8IT/G
         sxmw==;
        darn=lists.linuxfoundation.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776063876; x=1776668676; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHUon7mnOsFivonubjEmKa1tqwPu0cNQ4ngoVsPKvwA=;
        b=Tlebl5byUgKp+yV5h3/7hdawfmWxAS/bQY2DYt94aYummqB1IX2hFcw5aC3wMLygh1
         yyHJXm61pcgDvsNxXX8wqmB8U9C69i6zH2JoIj9nn7GmWSKRVI2BJRhAm4G4is9fATMu
         Go5dxSqwycaM1jpvOv0amo88+ZNoZkKnF9GZyCN9hZuK3ytFvv3Vb+xwfewfrw6b1U9m
         Fdz5LD5mBKy4alH+Apvkv3Zs47MzHdUvnROXF8MSeSrW45q48L+oU3+Hx2xB1seaJDzS
         XsjV4OjaWPUwtY2Ud9YqoXzHOFKIBefpylyoGsXcU2r7iS2mTVcwRPTmqjmRSLgO9kM8
         V2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776063876; x=1776668676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cHUon7mnOsFivonubjEmKa1tqwPu0cNQ4ngoVsPKvwA=;
        b=hvMC7SSBMdqgWIlS68EOJTp6GpOGDKxM9EeRUspg91VLlMGaHmedFP1/7toFiaWtiB
         xJ0BIcASVN2h+JHU93U7XSLiLRrIbJX6RLEBsltsr6J0bp+elqK2oa+W0kfm2yoLAwY/
         QxZC0W/DoFy9/PQvVOFvVOnpZiW56hk/Cm/7zB8+WLfKaKOljRUSm49ePF1qLSGTlsap
         J1PL9bY8nJFtAhcfO8ku2+sU+cy3V2m6l0gGGvjI7fMQo0E9S3NIGRj3sD4Ry8mJWhpY
         NEcDVatcMK0SOz5F96vi3pa6AMMEKDYvM0+cwCbk7kgphUryvDxYAx3D4TGFbD+ja8Ga
         MDig==
X-Forwarded-Encrypted: i=1; AFNElJ+Q+wiv1eejjU3oZi9Yyxbme3z0LB9uecefKD49JUXC2S0Yf70SNkxOIKRR5bc6yTTgqhu+RpplgsYWIhNTE/9AmvpFPg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwQXMDYjN+j4HO7bX3y+U43H8U+5gmDS1wcn+lIymvJkgekSva+
	63weOhHMStMDSOB4ZSX0MaLgX3LJ5J99Y/n1VXzgPPMAmCQGW7jK80yT7t+BUQIlobZsYJiqycy
	MhbkzLKTKzkDK4w8493sHPkjABQvuQf4=
X-Gm-Gg: AeBDieuonP2UrbUYz94ayvQDmZKxin22t05qgIZNIaSnyBTN0nnUfo2UWMd/1BVmb+8
	rdot8goSVGDq167pqV2AIH2ReLmE69g77jt1l9caEQ5OYyyVsk31Lw+oSl8LZ1enW6Q0QkVS+zi
	SjaLu//CCosAYb0aVdKfTKVXNjlClFa79Tvx40cKgoZf2yf+9xCuGncl0zVe8nnd2bBbgm7UbWg
	MQ4xmH4Xgvsq0IMKFK8lLiukawVQYXfHkU0UBXG6YvNTOeDvmGs4+RmuWuu7FcsGmBvz5v51OgO
	/n7lUJ6vXP03hxjkqAD1g34lfGlNaA/yyjSXta9AMZNG/HBxCB1UoElDiyG595iUDTuNAjfXRTX
	1+OkgQlY=
X-Received: by 2002:a17:907:788:b0:b9c:2a5f:41c4 with SMTP id
 a640c23a62f3a-b9d72683456mr663199566b.40.1776063875616; Mon, 13 Apr 2026
 00:04:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412144552.18493-1-mahad.ibrahim.dev@gmail.com>
In-Reply-To: <20260412144552.18493-1-mahad.ibrahim.dev@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 10:03:58 +0300
X-Gm-Features: AQROBzA6J9Pun5_-q9iTAp8nKuVUe_q0RpEZJPgZRxShTkw4gmMnUf4srXfMbNM
Message-ID: <CAHp75Vdu6pih=NqkYT0CR_oLyr3YgNKBeqYM3+naqVp52UCgVw@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: Use %pe format specifier for error pointers
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kernel-mentees@lists.linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 5:46=E2=80=AFPM Mahad Ibrahim
<mahad.ibrahim.dev@gmail.com> wrote:
>
> The %pe format specifier resolves error pointers to their symbolic
> representation. Previously %ld with PTR_ERR() was being used, %pe is a
> better alternative.
>
> Fixes the following coccinelle warnings reported by coccicheck:
> WARNING: Consider using %pe to print PTR_ERR()
>
> Testing: I do not own the hardware, therefore I could not perform
> hardware testing. Compile tested only.

I don't think it makes any difference for this driver. But I am not
objecting to the change. Up to Greg if he wants to apply or not.

--=20
With Best Regards,
Andy Shevchenko
