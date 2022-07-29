Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C05AC19F29
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 Jul 2022 23:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09E3A831C1;
	Fri, 29 Jul 2022 23:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09E3A831C1
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=wQRaueez
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ibBMSlg6kld5; Fri, 29 Jul 2022 23:29:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 161DD82F31;
	Fri, 29 Jul 2022 23:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 161DD82F31
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6459C0035;
	Fri, 29 Jul 2022 23:29:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BCB9C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 23:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6415F82F3D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 23:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6415F82F3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nQjkPmVdpj_q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 23:29:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22D0582F31
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22D0582F31
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 23:29:09 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id c185so4680852iof.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 16:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=csp-edu.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=qWNh7vOk9tCkYV94WwXKMJ4uEd3sFIr85O9CxOfUKiQ=;
 b=wQRaueezeuI5pT4oYhFHZhZMItthSUgguL7GFYaB68jVps//cv0JYxK90b/gVoI05n
 h8dk3+3t6WieMLwz6z1FkKimPbVmxBxmwHfZ2H2GauMe/JDVDscps2uZS6q2n5ehoxyw
 K54ymHUibx6A+RwjmsE+sATpqcBcstkpP+aMgjfMXtSD1T7G06Bm/3FjtmkNfhzv8Yxq
 zj3bPFJ9BbBbJ5lQtFHs3M4iw3Y8yxFUXHwDZvz4iUR1t+dFmIS535MsNySc4XOqDTJN
 AzfiIGVwL8pvMskr8ehS/xgY2ZzFjfGB0VG+4x4NwHQxpcKiTtHsv6uQyoYdrTZlQsBx
 13sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=qWNh7vOk9tCkYV94WwXKMJ4uEd3sFIr85O9CxOfUKiQ=;
 b=wbADDJin2xby3BopaKXp1YNXv2KHXM/cWwVGvCY4vshDeDzOwudprelHIN4spl/wmm
 1v75ofhSeufSUGVpI+mQwstZ1j3dfKHWjewgrzuTQyc0qmOhwB2/VS8XH5RmGLqiqw6g
 3wk4K8xvl0nX8zImbCUevKG7Z9511qZFC4sD1ujz8HiBMUTEbr3R9SHsw2FVJQMenCa+
 V80JgwncjZWOrbdVIQUdJqq2xjns2Gg8yWAUvw5ZTbSnc79Fy/ZwdzdirmLX315H41Hm
 MHf2hB/ZQgTqG4W71JthZXu6dtnNTw8SpoOrzLIR6W9oStuICbR5CUiO/qoBTCt65y+e
 T6Ww==
X-Gm-Message-State: AJIora+hjhVCNW+D9n41XG5hQ68eqCRynv4Sv3MHdMvHGQpl17E81c5h
 nhCHwEfvqFf5qC0sQf64bxRjWvuEk5U2QqO3gK+EKdqyI00h4dz3HoOY3+WQk++7wDIjulbw/iw
 ffQtZwH+fG7fmKk/G1++WP0lxv2D9LDHrBWOq5OSeg2K14HJHMDW0QLkug/GDRRlZSVxc/vDjm5
 JyWymvdcnWrK9Ma0eNVt7RQw==
X-Google-Smtp-Source: AGRyM1uRQjDAUWSoc11u2QbNyEFqJJaHT/kHhRAen2+cI88tCY46m5+6iYzrx08XaKia2PfQSYlqDA==
X-Received: by 2002:a05:6638:12d4:b0:33f:aaab:8d84 with SMTP id
 v20-20020a05663812d400b0033faaab8d84mr2274213jas.67.1659137348018; 
 Fri, 29 Jul 2022 16:29:08 -0700 (PDT)
Received: from kernel-dev-1 (75-168-113-69.mpls.qwest.net. [75.168.113.69])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a5e870e000000b0067bd7f5f964sm2244967ioj.7.2022.07.29.16.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 16:29:07 -0700 (PDT)
Date: Fri, 29 Jul 2022 18:29:07 -0500
From: Coleman Dietsch <dietschc@csp.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] KVM: x86/xen: Fix bug in kvm_xen_vcpu_set_attr()
Message-ID: <YuRtQ/GHc3poAmHG@kernel-dev-1>
References: <20220728194736.383727-1-dietschc@csp.edu>
 <YuOPDpy+RqD09n3j@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YuOPDpy+RqD09n3j@kroah.com>
Cc: syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com,
 Dave Hansen <dave.hansen@linux.intel.com>, kvm@vger.kernel.org,
 Sean Christopherson <seanjc@google.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Pavel Skripkin <paskripkin@gmail.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Jul 29, 2022 at 09:41:02AM +0200, Greg KH wrote:
> On Thu, Jul 28, 2022 at 02:47:37PM -0500, Coleman Dietsch wrote:
> > This crash appears to be happening when vcpu->arch.xen.timer is already set and kvm_xen_init_timer(vcpu) is called.
> 
> What does "this crash" refer to ?
> 
> > 
> > During testing with the syzbot reproducer code it seemed apparent that the else if statement in the KVM_XEN_VCPU_ATTR_TYPE_TIMER switch case was not being reached, which is where the kvm_xen_stop_timer(vcpu) call is located.
> 
> Please properly wrap your kernel changelog at 72 columns.
> 
> Didn't checkpatch.pl complain about this?
> 

I believe I made the mistake of editing the patch file directly so it was
on me for forgetting to run checkpatch.pl manually.

> thanks,
> 
> greg k-h

Thanks for the feedback Greg, I believe I have (at least these) issues
resolved in the next version of the patch.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
