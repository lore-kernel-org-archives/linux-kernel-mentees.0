Return-Path: <SRS0=dyi2=JR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161DEC433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Apr 2021 18:05:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 786C6613D2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Apr 2021 18:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 786C6613D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1533F6088A;
	Tue, 20 Apr 2021 18:05:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hOSvzgUa2JmO; Tue, 20 Apr 2021 18:05:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C02C6071D;
	Tue, 20 Apr 2021 18:05:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 146A9C000E;
	Tue, 20 Apr 2021 18:05:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCCEEC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Apr 2021 18:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF6514024A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Apr 2021 18:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CJd1y5zNXDXR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Apr 2021 18:05:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67A2B400CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Apr 2021 18:05:29 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso5050229pjs.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Apr 2021 11:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=JA8qx0EbDvTtVFEz/kOy72b7rpmg3UOaKQCzUKfbJDY=;
 b=TbVAb6bT3CbLpH3SQ1jafqX+cJkdPMvDlazZzcBgdVx6qC5OPrRWwrxGCkVbOyobhR
 c2/DJzKtSlT+LHmqfa5OSbQyrAMLLBXTEtZw34UTKwqq7l0UovQxlrstXNsV3XulF5nU
 UV7bxSis6NbPTuucYu/vnkqlnbFxWtzdzXOHQORYu22uvgHRaW93npL8AOm6+/9gPA0V
 HLhsaXD0+AmGhfvqvJJ9qpJkQCjy2Pl+hVpP8dqypLL3AfKn84ybJtcUasM2Psuu74o0
 tHdr8UHEev9cLQ56+ppyVL6vfGexVQBYsI8uuwM19SvAnG3HolEKL8kpt/zlAkGRux/l
 B+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=JA8qx0EbDvTtVFEz/kOy72b7rpmg3UOaKQCzUKfbJDY=;
 b=cqY27iWboDaLsEr8uPReS5qAc5hZEWiMPxI9qFq9p4b8BQH7OUoxeq5N0v0/witIPU
 +BC54+oBUZdHs5UyJVKejbMK75ZG7Bvrx3MryG4jSWjVnmy/CWEv/VJbi972b8Bk/J3S
 M+zPGh9MZZ9CsiXcQCklotoERw/UXU7Sx9tLsiMQDEannMUc3xtvqyT6kYZU9wbgxzaD
 pgBzk+Yvj/jfWyN9vfE6F2QNPrrm/PeZI9XeIv1Z/XRek1MXfGDKFwK54b1PBVrjhuWB
 VUZUONk1of3MRUckY/eB5M8vSv64Cx+tzlNOhoBu3SnhGeJc7E9c6ZGSEqXakrOiSquN
 d0Tg==
X-Gm-Message-State: AOAM532M91bfMbeKEfQpQcPiQIUMVoIwym6OEulZ7nMOMGQ+HjaSRjBA
 DoVgRVz05pKT/zNXCqUg+N4=
X-Google-Smtp-Source: ABdhPJylmkMBKZM7KX5qKlnXCjZy9+dLKa+aKsB1tA8f+rnzubaDWEXPpcyIgql0VjpQkU1eR8t5Ew==
X-Received: by 2002:a17:903:304b:b029:eb:4cf:8321 with SMTP id
 u11-20020a170903304bb02900eb04cf8321mr30125875pla.40.1618941928776; 
 Tue, 20 Apr 2021 11:05:28 -0700 (PDT)
Received: from localhost ([122.172.230.93])
 by smtp.gmail.com with ESMTPSA id a27sm3705045pfl.64.2021.04.20.11.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 11:05:28 -0700 (PDT)
Date: Tue, 20 Apr 2021 23:35:25 +0530
From: anupamakpatil123 <anupamakpatil123@gmail.com>
To: kernelnewbies@kernelnewbies.org
Subject: [QUERY]drivers: pnp: isapnp:proc.c: assignment inside if statement
Message-ID: <20210420180525.m2fckb2iowrzo2c4@ubuntu>
MIME-Version: 1.0
Cc: bkkarthik@pesu.pes.edu, linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============3542524646321010595=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============3542524646321010595==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y53hp5xgijjigtte"
Content-Disposition: inline


--y53hp5xgijjigtte
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is a code snippet from line 63 of drivers: pnp: isapnp: proc.c
This is an error I came across while looking through some checkpatch
errors.

if (!(de = bus->procdir)) {
                sprintf(name, "%02x", bus->number);
                de = bus->procdir = proc_mkdir(name, isapnp_proc_bus_dir);
                if (!de)
                        return -ENOMEM;
        }

In the above code snippet is assignment inside the if statement
necessary? Can the assignment be done outside the if statement as it is
a good coding style practice?
Is that change sufficient? I dont want to just shut checkpatch errors as I
really want to improve the code.

Thankyou for taking your time to go through this.

Anupama K Patil

--y53hp5xgijjigtte
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEDSQZGCDcREXgcOjQtGmOOZV75b4FAmB/F94ACgkQtGmOOZV7
5b7MzwwAoFJ6Dc/WitRHTU4nCPS3iYARdimbGeTIo21JXyMQ0bfH4NIFiRe+PmIo
o0oa/+nFrngz7by3DywNd9yAtuJAI7Nn2srqbmbSordvfDF8gL8pRGnSoKJYN7fJ
GMWdKNy8VxpcdbNQ8csWAaYsWIwJmdzVVvegyqCFJsllhYNMcSjxZ7GG1Sjy/K4Y
w2IvFbDqrJ1IXeSO7C5SBNfgCsH6h258LFCr9cVqYqv0/wjCAisvqqvmnvF9o37u
mAcgbAcQxUbGljEwJ1d/oc5IGs6ndr/q0e6rX5s9jRD4Ab0Y7rsgcy7XhzfTlAF+
JDu+RVX04LHvi7eoA7VsyQkREsHR7dyTGCNc6djft/p9eimOaCnlfw8UZYGT+PiC
Uu93QV0n/ca3Mx623YS5dKqCOvK5+4aFM4GWS0xaWSzF2Ckh9CXulxN7Yyt5aIJS
M5fVU1Uig5cSjfyAntGYOiL0qaGOKAdMyIHBn9tRm8ZxO0LbayS6fOmxp5CdhZuB
DZfg6h7f
=ee1y
-----END PGP SIGNATURE-----

--y53hp5xgijjigtte--

--===============3542524646321010595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3542524646321010595==--
