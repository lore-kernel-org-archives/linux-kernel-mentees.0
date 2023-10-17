Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43B2CDB474
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Oct 2023 10:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E15C41B66;
	Tue, 17 Oct 2023 10:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E15C41B66
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z0gC2y37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CfEYccyYjItE; Tue, 17 Oct 2023 10:31:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 442A840318;
	Tue, 17 Oct 2023 10:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 442A840318
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A153C0071;
	Tue, 17 Oct 2023 10:31:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 339C0C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 10:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01A0640318
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 10:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01A0640318
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5mhVm6IPcU1G
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 10:31:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0862B40324
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 10:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0862B40324
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697538705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dGImsWzgXv54P+RV8cdB+PVPykD6eKoMxJcB86BauK0=;
 b=Z0gC2y37iE8FpFYhkeP0GYMIC5lieeSYrVuHesnY7JH5S95smsWK8VXQSspMGS1B31BwMf
 9YtXJIEq7xQH4LtcSPd0NvXIHYn0OZewQJOjdk4RAieuuyLjPFhlBlsKgSjzJBZg/DcNHZ
 I7xxbslngvuDoCwxNQoQhX0dc9uyNjc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-mduYtSLBNsOBxMJRzRcw3g-1; Tue, 17 Oct 2023 06:31:39 -0400
X-MC-Unique: mduYtSLBNsOBxMJRzRcw3g-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-5386aefc01eso1042225a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 03:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697538698; x=1698143498;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/PQNd65jbO86OIlgL0xtBIZWLMK2wzq1JGDzpYDTVTc=;
 b=nb2LG8HtNCT7HJ8vsz+RHrgjrn1CVUosjI+YBdhb23x5jaufOUws/SFawQ3vMcsziE
 KRgWnzd4G3jLjw3lhpOkq1S2CrYhnw8GcYHrja7Mi4eyEGRDoE0rAkqx3ELND17s+wdh
 5GtYh6bIjLdNFs4eB/IiSFRuG8ywahJkChwdqVopNHp6PcVZg71edXy4YXNUzns3Ogtk
 S4Fw8bW5in0v3FSAjHmUwWw0WGKJWWS04ypaL0LTFncPGZTF6+75JbY51HE95VDH6BhN
 hjp6m6Yz184qRfZhLd9YL/Y9oWjcPGxfdkfq5iF9BebpNug04ZtIZgQ/n/Rnlti/DVl2
 at0w==
X-Gm-Message-State: AOJu0YxrMkimNVvwRuRhIbe0KToC/3894BGIOYr2k0srs2IMzU3RiBEy
 fQjMmBPgJYpH0qVVir0pXPfqQ5SMZnhk0sI2KIZbtmu4cXfv557Ds6ErALHJdlEzMekK0WcgOdL
 ZZYMH+TOTUjOsg9vo+XXXFyz/TEu8dYWkHNMiihr34OiiOD3qWw/nk9PS
X-Received: by 2002:a05:6402:31e1:b0:53f:12e0:fba3 with SMTP id
 dy1-20020a05640231e100b0053f12e0fba3mr1304507edb.1.1697538698511; 
 Tue, 17 Oct 2023 03:31:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAbwOnF0ogNOzyxOwQAvKPzIBz3SQuwXSsW9rlIJHyh123Wldx7SAZ8wGa6WB5E/6ljLTIkA==
X-Received: by 2002:a05:6402:31e1:b0:53f:12e0:fba3 with SMTP id
 dy1-20020a05640231e100b0053f12e0fba3mr1304490edb.1.1697538698147; 
 Tue, 17 Oct 2023 03:31:38 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-233-87.dyn.eolo.it.
 [146.241.233.87]) by smtp.gmail.com with ESMTPSA id
 eh15-20020a0564020f8f00b0053e775e428csm928723edb.83.2023.10.17.03.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 03:31:37 -0700 (PDT)
Message-ID: <20aed7c604115c7f346cdbbe848c37feded3cf21.camel@redhat.com>
Subject: Re: [PATCH] net/tls: Fix slab-use-after-free in tls_encrypt_done
From: Paolo Abeni <pabeni@redhat.com>
To: Juntong Deng <juntong.deng@outlook.com>, borisp@nvidia.com, 
 john.fastabend@gmail.com, kuba@kernel.org, davem@davemloft.net, 
 edumazet@google.com
Date: Tue, 17 Oct 2023 12:31:36 +0200
In-Reply-To: <VI1P193MB0752428D259D066379242BD099D3A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
References: <VI1P193MB0752428D259D066379242BD099D3A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 syzbot+29c22ea2d6b2c5fd2eae@syzkaller.appspotmail.com
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

On Thu, 2023-10-12 at 19:02 +0800, Juntong Deng wrote:
> In the current implementation, ctx->async_wait.completion is completed
> after spin_lock_bh, which causes tls_sw_release_resources_tx to
> continue executing and return to tls_sk_proto_cleanup, then return
> to tls_sk_proto_close, and after that enter tls_sw_free_ctx_tx to kfree
> the entire struct tls_context (including ctx->encrypt_compl_lock).
> 
> Since ctx->encrypt_compl_lock has been freed, subsequent spin_unlock_bh
> will result in slab-use-after-free error. Due to SMP, even using
> spin_lock_bh does not prevent tls_sw_release_resources_tx from continuing
> on other CPUs. After tls_sw_release_resources_tx is woken up, there is no
> attempt to hold ctx->encrypt_compl_lock again, therefore everything
> described above is possible.
> 
> The fix is to put complete(&ctx->async_wait.completion) after
> spin_unlock_bh, making the release after the unlock. Since complete is
> only executed if pending is 0, which means this is the last record, there
> is no need to worry about race condition causing duplicate completes.
> 
> Reported-by: syzbot+29c22ea2d6b2c5fd2eae@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=29c22ea2d6b2c5fd2eae
> Signed-off-by: Juntong Deng <juntong.deng@outlook.com>

Have you tested this patch vs the syzbot reproducer?

I think the following race is still present:

CPU0                            CPU1
tls_sw_release_resources_tx     tls_encrypt_done
spin_lock_bh
spin_unlock_bh
                                spin_lock_bh
                                spin_unlock_bh
                                complete

wait
// ...
tls_sk_proto_close

                                test_and_set_bit(BIT_TX_SCHEDULED, &ctx->tx_bitmask
				// UaF

regardless of 'complete()' being invoked before or after the
'spin_unlock_bh()'.

Paolo

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
