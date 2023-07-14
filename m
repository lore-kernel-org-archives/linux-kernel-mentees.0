Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9650C001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Jul 2023 22:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 579DD834C6;
	Fri, 14 Jul 2023 22:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 579DD834C6
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xO0lJMv5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4JBNbf7r4uhE; Fri, 14 Jul 2023 22:02:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5418181E40;
	Fri, 14 Jul 2023 22:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5418181E40
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21777C0071;
	Fri, 14 Jul 2023 22:02:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91FCAC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 22:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63C4781E5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 22:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63C4781E5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZ4TBfAAZXwz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 22:02:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C503A81E40
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C503A81E40
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 22:02:09 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-668709767b1so1830669b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 15:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689372129; x=1691964129;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=B3DZ3QodLkTjKM8tLx8t86MoU1m0TSwGIA4Lmr1eciw=;
 b=xO0lJMv5ZVBnZmrsoKXYHg+5jX2CO6Anylt5EKGGHaPYsJyD2naV+Einq1HkpCbDEd
 70g3nFQQ/zzIUxit73R0+RWL+bRmq2+ip05QObmumBglucmYVvdzTpLteGwAbhKjoq2b
 YM6y7rH7FaDGcK4LloKDQHGr7mnuu+MWuAj/yt50MH2uvmPMHONXXCWiB7SkMzHWuHhc
 pZa/D0c3BSbMEde+jqms0oOT04fw9S8YbwAdQDmsvvaAUTiC/aLViiREOs8Ud8kkmyRu
 Ov5ek9e56Lx9wWpZVgKFDBXGRgOIHepnFTjp9MqaotCy6mue0pws3PGWTFKzQca6squv
 iD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689372129; x=1691964129;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B3DZ3QodLkTjKM8tLx8t86MoU1m0TSwGIA4Lmr1eciw=;
 b=FNsQLteOdDq8olM1w74OEvgPTW2ubXUE09NL0pICCOYFViQlws77uc1evHr8RirAee
 sHPKywbp4IptXr+qO6LDzfxjHH30d+J8iq8Mz6+EZeNMahziSKTu34rfqq+Pr4gvV40r
 R2WUX4rIJvWURwwXCZXbFurSYwvDLy2Vxi2/zLFm+MyICF/8awII9gJXX2XiTflidew3
 u0rPYfkdAJOsKKQxeD8khWhR3f8iyU7ao8471qIiOYxfoBoM1xurHtGNvmz1UE7veB5H
 P7loLa9dQxMuw/XwoPCiDssLD1nYxmO9wwZx0LNMX3NpFZvVSU28Ya4SBNBgWFP3aX62
 54ng==
X-Gm-Message-State: ABy/qLa9pKXQV9eDHg23cHQ2ACklV5xsxzRPLQ91BHYpTmQubgxmS7v1
 cHf3wlvGwYYrdcsAJ8tWgkBZdwxdoW+RQg9EdbM=
X-Google-Smtp-Source: APBJJlEPhk3QAeLODRppoEJ8Y7tCUc2xqclRZUChAEpPHOArrhf5SttTvbB0tk/lqEdMIxDEWm45Bw==
X-Received: by 2002:a05:6a00:cc5:b0:668:846b:9b5d with SMTP id
 b5-20020a056a000cc500b00668846b9b5dmr7234962pfv.5.1689372129136; 
 Fri, 14 Jul 2023 15:02:09 -0700 (PDT)
Received: from fedora (61-114-134-192.ppp.bbiq.jp. [61.114.134.192])
 by smtp.gmail.com with ESMTPSA id
 a12-20020aa7864c000000b00666e649ca46sm7608915pfo.101.2023.07.14.15.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 15:02:08 -0700 (PDT)
Date: Fri, 14 Jul 2023 07:34:03 -0400
From: William Breathitt Gray <william.gray@linaro.org>
To: Anh Tuan Phan <tuananhlfc@gmail.com>
Subject: Re: [PATCH] tools/counter: Add checking directory exists for make
 clean
Message-ID: <ZLEyq1Nx085jlxDr@fedora>
References: <362e127d-6018-5fc6-247b-3c729b99d946@gmail.com>
 <ZKtZ1WB9LdszbxU+@fedora>
 <e62f481d-f939-a12b-7f8a-ec1db95c7b8e@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e62f481d-f939-a12b-7f8a-ec1db95c7b8e@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, rongtao@cestc.cn,
 ricardo@pardini.net
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
Content-Type: multipart/mixed; boundary="===============1426593860732602192=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============1426593860732602192==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kbfYM6KMOcOKmno2"
Content-Disposition: inline


--kbfYM6KMOcOKmno2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 14, 2023 at 08:57:21PM +0700, Anh Tuan Phan wrote:
> Hi William, the race condition possibility is a good point. Thanks for
> suggesting me. Will send a new version with using `rm -df` instead and
> add the appropriate CC lists. Thank you!

Hi Anh,

Because this will fix a failure, please include a Fixes tag as well that
references the commit that introduces the rmdir line.

Thanks,

William Breathitt Gray

--kbfYM6KMOcOKmno2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZLEyqwAKCRC1SFbKvhIj
K+ziAQCGY7jdv3OM3sbn+dCb3FZsFSrqndT/N7q7OXZdDBiEwwD9GrllxnmAAjJU
2pmDiD0aeGvLOlLxjxi7SHSWcRRAZQs=
=CrFK
-----END PGP SIGNATURE-----

--kbfYM6KMOcOKmno2--

--===============1426593860732602192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1426593860732602192==--
