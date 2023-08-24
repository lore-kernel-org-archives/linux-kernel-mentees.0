Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57786C88CB2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Aug 2023 23:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3DB960F07;
	Thu, 24 Aug 2023 23:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3DB960F07
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cAAxU1/u
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cXE6y52rrB0f; Thu, 24 Aug 2023 23:27:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AB26860C04;
	Thu, 24 Aug 2023 23:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB26860C04
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E6D3C0039;
	Thu, 24 Aug 2023 23:27:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9F70C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 23:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DA86415C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 23:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DA86415C8
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=cAAxU1/u
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fxuspg-N2k6D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 23:27:27 +0000 (UTC)
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE28140018
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 23:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE28140018
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-76ef6d98d7eso23566785a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 16:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692919646; x=1693524446;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yKfUzKb+moVRVD1OhhkPh9UKTtSvWaehu8weVUwd3Eo=;
 b=cAAxU1/uNtWjZ+NjQ15skzXU/jYj6so77FDkM7b/t+8AESpN0ToXMS8jIsywvFSIQO
 uGodsmrk8/VZPvvUqc9+WgaRBKnZ/x1YJar71UVpeZRtUn9R36u9+scH4RkrHvKbGmn7
 qxXjvQ+iHFeOoLAdmsjLawplY1Cam502oOJbk1oY7/FUg2PT4VbWZQVmGoo6+eZO/rLQ
 HyogZkZUKEQCGPHRdmwBXgxgUW9PhymyVoeVB4lN4JIDb9LpxyZDTBYerSf0atwZGI+M
 A80eW0II8O8TxczpYcbrg50mWwfrWSmAzngOB9nFheRQcpPGMUCvuYdm+rCufbVfandI
 hPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692919646; x=1693524446;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yKfUzKb+moVRVD1OhhkPh9UKTtSvWaehu8weVUwd3Eo=;
 b=LyGrAYpbY6VhCgLuUaYKArXtsOKGGam3JD3l4sXXoFvaTeNTICqOsrKswscvEvEgJO
 9xe6H0MC7ovXEnHRTst9SQHiuSpIISSLwluMmCreS4aiXa3q1HBcpR0YYDLhVh74FyRP
 bZvvblskEszmbOhdr0dKz9XfEhC2zKFc5zg9tFGDtLd7KMHgIjfZpGm6dTOk6Emb6psN
 67HzusCZCK4zxwaWgXb931Rup9EAFljub8mbvi0k7f4uN5ScXbT9SWwlLbxww/sNH+SP
 gtR83PjdX9SBeSs6KicmeDKhKQFjld+Ar+IyTr/ItJFrEZBw3oqBl+LeH54QosqrJBcy
 5Kjg==
X-Gm-Message-State: AOJu0YyX2IKDD9ovQP1fqx7Wvic97DZ9IzAOlo8r86kIptKxd+N2jt75
 v68bsaBtdTJwXB3ikkG5plM=
X-Google-Smtp-Source: AGHT+IHJMe3uiyWF2JRpLpsQnwj+Ad3uh5evDhJ/ndu75Vhbplxi634ERY2p6zKa6luKrWbZUyy5ZA==
X-Received: by 2002:a05:620a:25c8:b0:76c:c99b:8db with SMTP id
 y8-20020a05620a25c800b0076cc99b08dbmr18487896qko.17.1692919645713; 
 Thu, 24 Aug 2023 16:27:25 -0700 (PDT)
Received: from localhost (172.174.245.35.bc.googleusercontent.com.
 [35.245.174.172]) by smtp.gmail.com with ESMTPSA id
 d4-20020ac86144000000b0040ff25d8712sm167666qtm.18.2023.08.24.16.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 16:27:25 -0700 (PDT)
Date: Thu, 24 Aug 2023 19:27:24 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>, davem@davemloft.net, 
 keescook@chromium.org, luto@amacapital.net, netdev@vger.kernel.org, 
 pabeni@redhat.com, willemdebruijn.kernel@gmail.com, 
 linux-kselftest@vger.kernel.org, shuah@kernel.org, wad@chromium.org, 
 kuba@kernel.org, edumazet@google.com, linux-kernel@vger.kernel.org
Message-ID: <64e7e75ce75de_4b65d29470@willemb.c.googlers.com.notmuch>
In-Reply-To: <20230824214506.137505-2-mahmoudmatook.mm@gmail.com>
References: <20230824214506.137505-2-mahmoudmatook.mm@gmail.com>
Subject: Re: [PATCH v3 2/2] selftests/net: replace ternary operator with
 min()/max()
Mime-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
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

Mahmoud Maatuq wrote:
> Fix the following coccicheck warning:
> tools/testing/selftests/net/udpgso_bench_tx.c:297:18-19: WARNING opportunity for min()
> tools/testing/selftests/net/udpgso_bench_tx.c:354:27-28: WARNING opportunity for min()
> tools/testing/selftests/net/so_txtime.c:129:24-26: WARNING opportunity for max()
> tools/testing/selftests/net/so_txtime.c:96:30-31: WARNING opportunity for max()
> 
> Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>

When submitting a new version of a patch, please resubmit the entire
series. I think 1/2 is missing, per patchwork?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
