Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B51CE7A8C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Sep 2023 17:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87B4041836;
	Sat, 23 Sep 2023 17:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87B4041836
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XMwrpVZe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZUP4ID0ccM5; Sat, 23 Sep 2023 17:32:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4F9E041828;
	Sat, 23 Sep 2023 17:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F9E041828
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CFB7C0039;
	Sat, 23 Sep 2023 17:32:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53C69C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Sep 2023 17:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 219B960AB5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Sep 2023 17:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 219B960AB5
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XMwrpVZe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7CYb72B-a5qe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Sep 2023 17:32:03 +0000 (UTC)
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA28460A8D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Sep 2023 17:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA28460A8D
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1dc6195bf93so2139071fac.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Sep 2023 10:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695490322; x=1696095122;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6gvvXDcU16cywZW5qlvx++3wmaqbF3rOKpU79fjE2DA=;
 b=XMwrpVZe+tE0hHyMeIhg7IOKqhonyGGD4vmircYoD+dWKRo6Gvr8Nq2x/5uTK07ujN
 jKVaGwZ8nS4oS2x5BcjGS0KYPsHkJ9Sx7IXdwOeEv1PKAM0X4EwguOt23uBb2q3XHC8l
 TkujNbT32sI/dZtOchv9W8Bd+v0O+oAJBeFEkHNfQahVB2H0r1jeW9gSbpQzckByPJTf
 eB1kmR15DdVUaLgm+cyFwwu2JYPwLXoP65lG9Q1RqVC52Md4D7HgF0aOUVTp+Cb0wpcT
 pmp/Youv20BXiR7O/zRyNvCiQ8dYBBR6ywvDcAQQgxbVCxyoKOxFEi3KTtG8ihHGiYz5
 ZVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695490322; x=1696095122;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6gvvXDcU16cywZW5qlvx++3wmaqbF3rOKpU79fjE2DA=;
 b=EC7WF+P4b6meSbJ+wfCZsLSz7yZ9SVd1tVvU5owQCzbmHTrAqKAtGntAN4/JxsFwDG
 govLWt0dvwZIV+hXw92HO8EyFvGmoxgYlW3XVVfJ7Q02FrymfmzRDszrcdaoncQcVQBt
 5ARhbF3AmtqMTdEP34g0hZwHQgoAlM22TcOFqOnHSpOtl9PGoV3NrsOHFLW5miQyTx/t
 HHHv6c8UchCkpIl+uijCeg1YkLaQ2qyubxXYfLE0N9Jl5GPv0ldknQ226+kPV+pE/ghO
 ijUSXm+pRHOFJ5EYSE9EwIC+VcJNmUdZjT6Qvrztk5B2YL8nuFt5+ykgRwNRb426ZVuN
 /fOg==
X-Gm-Message-State: AOJu0YxWiWHM2hJRgD+omC50zUD1ovejspyspO3kgiIpizywiDdGIF4b
 8BmUvHqHNlOapES8+/yg83k=
X-Google-Smtp-Source: AGHT+IH1R5plTtx2ZeV0MFIuVMXVY9nSXiBJzqZqz1zZ3Z5cwG1k3VJBllqOCZJskhsQ58R2CUG34w==
X-Received: by 2002:a05:6870:2308:b0:1d5:5660:3ae0 with SMTP id
 w8-20020a056870230800b001d556603ae0mr3486958oao.20.1695490322568; 
 Sat, 23 Sep 2023 10:32:02 -0700 (PDT)
Received: from atom0118 ([2405:201:c009:52e1:3075:4405:fdad:b3f9])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a656896000000b00565e96d9874sm4518382pgt.89.2023.09.23.10.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 10:32:01 -0700 (PDT)
Date: Sat, 23 Sep 2023 23:01:57 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: stefani@seibold.net
Subject: Re: [PATCH v1] samples: kfifo: Fixes a typo
Message-ID: <20230923173157.GB159038@atom0118>
References: <20230817173636.78757-1-atulpant.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230817173636.78757-1-atulpant.linux@gmail.com>
Cc: shuah@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

On Thu, Aug 17, 2023 at 11:06:36PM +0530, Atul Kumar Pant wrote:
> Fixes a typo in a comment.
> 
> Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> ---
>  samples/kfifo/dma-example.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/samples/kfifo/dma-example.c b/samples/kfifo/dma-example.c
> index 0cf27483cb36..112b0e427199 100644
> --- a/samples/kfifo/dma-example.c
> +++ b/samples/kfifo/dma-example.c
> @@ -80,7 +80,7 @@ static int __init example_init(void)
>  			break;
>  	}
>  
> -	/* put here your code to setup and exectute the dma operation */
> +	/* put here your code to setup and execute the dma operation */
>  	/* ... */
>  
>  	/* example: zero bytes received */
> @@ -109,7 +109,7 @@ static int __init example_init(void)
>  			break;
>  	}
>  
> -	/* put here your code to setup and exectute the dma operation */
> +	/* put here your code to setup and execute the dma operation */
>  	/* ... */
>  
>  	/* example: 5 bytes transmitted */
> -- 
> 2.25.1
> 

	Hi all, can someone review this change ?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
