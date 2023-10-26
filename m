Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA983C25B67
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Oct 2023 15:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47F6B42223;
	Thu, 26 Oct 2023 15:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47F6B42223
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nQROJ0Zy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mUANPbckeT2D; Thu, 26 Oct 2023 15:07:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3765D4221D;
	Thu, 26 Oct 2023 15:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3765D4221D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 122CBC0071;
	Thu, 26 Oct 2023 15:07:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42C2DC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D67C42227
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D67C42227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fMhackOvIiS4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:07:54 +0000 (UTC)
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6633542223
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6633542223
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-57e40f0189aso565378eaf.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 08:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698332873; x=1698937673;
 darn=lists.linuxfoundation.org; 
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VVZOgV4TaU7C0kwXpqOjxAK7iXfSpgYkTcenW5IXZCQ=;
 b=nQROJ0ZyNDSnwx8IEYpELx6ruqYSKluP9qcF2NazOl+ytreCQqaKrIAHw6Cx7+kHe3
 2jPhv3VXHtthIu6O/FrqaT0nwwITJXg8v/kkY4wJtVQV1uRrslBBPAk7g7NQHwoavHNb
 /Rh9ukbnE4EsxLzYYEurD+DuvQMOMtPzp0sIoz0p4SeBaYY6pCutMmdrKzDcMP5nqjQ6
 Kz40ZpDD/JeAKuyUqvcNvc41s3TTotUbxe4Wb9W8xin8PpxNCKyqKXle01H1HiWldLCi
 5GuZJ7t0LtFh91ZBCH3HhM9O5BqCU7MG+xHLlhjmCAv4fHRXU2tqNY/OhKBChEHdrRsV
 7/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698332873; x=1698937673;
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VVZOgV4TaU7C0kwXpqOjxAK7iXfSpgYkTcenW5IXZCQ=;
 b=EkRIzaqy/WfFCQzxA14ycgxX0b7j+PY8HjHHAil8JddmTWdyy0lsseTtPPGbAVnreU
 4/vgRjROcKG/8AnXT9GQ9eTIenYDR89ak6j3HeeL5qpm8LpTU829g6W7jxE5zqCjfTaD
 U6EdTJsKqqhNYc19Jt9mrBLVSfihgTezHFEfXexoW5iuXzxMXy6Xo612nT6V4+xuo7yd
 CZ4aqrjG1kCGiaq8sdtHm/GE/kFT9S11TtxfNQz9RbIrR/xMauZDoz4P/LZR4jHgPAYb
 g5e9h8+FayfkoYfk/yqt0A4FVepw2uykMN9SI0/LHFbXvp7kaQTMpOeIjANfh66t8h9d
 2nyg==
X-Gm-Message-State: AOJu0YxKHyExMmci9GuLLf2alUlXCOZQrqfBrw2DFEBgSWwhm9AaX1rz
 07JwYhF2YngvySvEQx65IB2sp6HTFvWIGkuu4/I=
X-Google-Smtp-Source: AGHT+IHLUFJBwxSSzLEhcDelbU5shJZAeiSRkaxAOjkWV6IZG8ga8EyA3fKdt8864gXDPzN4c7ZVovuKUSAhi22VkH8=
X-Received: by 2002:a4a:d032:0:b0:57b:7e41:9f11 with SMTP id
 w18-20020a4ad032000000b0057b7e419f11mr18552571oor.2.1698332873236; Thu, 26
 Oct 2023 08:07:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6fcb:0:b0:4f0:1250:dd51 with HTTP; Thu, 26 Oct 2023
 08:07:52 -0700 (PDT)
In-Reply-To: <b0654dab-eb43-444e-a820-db169812e1ba@efficios.com>
References: <20231025165002.64ab92e6d55d204b66e055f4@linux-foundation.org>
 <20231026121621.358388-1-singhabhinav9051571833@gmail.com>
 <20231026091222-mutt-send-email-mst@kernel.org>
 <CAGudoHFXH_FDgKRaJvVgQ3W8wD2TC=8yhiNm1NECApnQ-CNAZQ@mail.gmail.com>
 <b0654dab-eb43-444e-a820-db169812e1ba@efficios.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 26 Oct 2023 17:07:52 +0200
Message-ID: <CAGudoHEfjSAim6Hh-qYPY+qi8nbLx7J3YdpGgFwSvD7xbeYR3w@mail.gmail.com>
Subject: Re: [PATCH v2] Fixing directly deferencing a __rcu pointer warning
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: brauner@kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 peterz@infradead.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Abhinav Singh <singhabhinav9051571833@gmail.com>, shakeelb@google.com,
 akpm@linux-foundation.org, surenb@google.com, michael.christie@oracle.com
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

On 10/26/23, Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:
> Drive-by comment: perhaps use rcu_dereference_protected() ?
>

Definitely.

But as I mentioned even after applying the patch there are uses which
should have been reported (and consequently sorted out). If one is to
bother with any of this at least the entire file should be covered.

-- 
Mateusz Guzik <mjguzik gmail.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
