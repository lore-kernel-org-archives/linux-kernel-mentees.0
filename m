Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00837C25B0C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 Aug 2022 00:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C6FD60AFF;
	Tue,  9 Aug 2022 00:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C6FD60AFF
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Qd1JgbOf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 98bh9GT0dFvU; Tue,  9 Aug 2022 00:36:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 943F360AEA;
	Tue,  9 Aug 2022 00:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 943F360AEA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6026DC0033;
	Tue,  9 Aug 2022 00:36:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2233FC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 00:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F120640438
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 00:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F120640438
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20210112 header.b=Qd1JgbOf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rktfc6zSyCeH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 00:36:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DE814028D
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DE814028D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 00:36:56 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id c24so5183354pgg.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 08 Aug 2022 17:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=a/4gloR0juBdlHHYNcJlbW/FTcwo8LAnogSl5yyVZ1Y=;
 b=Qd1JgbOfAQNNkH2ORrSMNQ5Hz4GYqKxE6fcYDw3qmHkJH5xcda/qjULZOLi8Yh8fA5
 PX4UJcXc1GpZleJAwkkKWTg0TrA+g5HSpVYLnyo+gIo4rUvSDSuyKy5x9n1xza8X5Vp+
 jg9oMmtRuuiBDWU2pA9e071NnCUTpVJ5R7H9+u9rxmsE9rJinMf0HR4WvlqMSvaRtll3
 cANxEoezLIyL9tIkQr84jQosUCYuv6m1Gn3j6G14K/zI5tk4Ovt7Q6J64bG1nMs3fmVe
 Ji/5nMH9QiMltWsP+MpoREAP5S3/DXrzX6H8avLaRRKm039Asf0ZM4WZ0A4jwpDogp0u
 fdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=a/4gloR0juBdlHHYNcJlbW/FTcwo8LAnogSl5yyVZ1Y=;
 b=njJsTeG0tMgf8Af5YQZZR1Nh782B/k79RkW8EPhpYTfegUn8tx2Xa0PbOFfSxRtPeo
 96M2iBliKllsxxdGJBJgnwFesl3lJuUXQse+v12yIw+/5ehOHXVxyvml+VXiHIAn6yG3
 4RPSrqurRIlzqjLCyFm5hGmrAa+qvLdifsfX+XPSQLOCjTShdRId5lxfkJTBjEctrdPK
 3OsetiUT4NBNcl481Esb3milNBQ9KuGcqVCDq8lrx+oJd+pale8d6AlUhA/MgnuNxmq0
 7zMGAxavGl+rTHPVHsNJW9scAEyhO+k24MCnDRXkYGaVtZefCrOWNydeeO07X7fJbTkO
 IDxg==
X-Gm-Message-State: ACgBeo36MzlyLAX72gPrLQlShvdfbh52sjheR9VSXJ/6HivCJ9+NRZ9K
 9bS65EQOlHC2cUIVYM7uIo+CTA==
X-Google-Smtp-Source: AA6agR6I9AqcP5FN+oFJsgJk1bziGLbi1GyQZllwCS+9VU1jyl56wRMIelcm1R7MYNSCzPlx78Ksww==
X-Received: by 2002:a05:6a00:1706:b0:52f:6f75:991b with SMTP id
 h6-20020a056a00170600b0052f6f75991bmr5124904pfc.34.1660005415453; 
 Mon, 08 Aug 2022 17:36:55 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 n2-20020a17090ade8200b001eff36b1f2asm8804317pjv.0.2022.08.08.17.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 17:36:55 -0700 (PDT)
Date: Tue, 9 Aug 2022 00:36:51 +0000
To: Coleman Dietsch <dietschc@csp.edu>
Subject: Re: [PATCH v3 0/2] KVM: x86/xen: Prevent Xen timer init when running
Message-ID: <YvGsIwSwMdt7BRXL@google.com>
References: <20220808190211.323827-1-dietschc@csp.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220808190211.323827-1-dietschc@csp.edu>
Cc: x86@kernel.org, kvm@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H . Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Woodhouse <dwmw2@infradead.org>
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
From: Sean Christopherson via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

+David

On Mon, Aug 08, 2022, Coleman Dietsch wrote:
> Coleman Dietsch (2):
>   KVM: x86/xen: Initialize Xen timer only once
>   KVM: x86/xen: Stop Xen timer before changing IRQ

Paolo, can you grab these for the current cycle?  FWIW, I believe David's ack still
stands too.

Thanks!

[*] https://lore.kernel.org/all/9bad724858b6a06c25ead865b2b3d9dfc216d01c.camel@infradead.org
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
