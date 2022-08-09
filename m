Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193FAC25B07
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 Aug 2022 12:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D4614064D;
	Tue,  9 Aug 2022 12:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D4614064D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q/pG6cTv
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HuE9niGpZF9g; Tue,  9 Aug 2022 12:59:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9DB9040643;
	Tue,  9 Aug 2022 12:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DB9040643
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75EC1C0033;
	Tue,  9 Aug 2022 12:59:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A1DBC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 12:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E664760E3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 12:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E664760E3A
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q/pG6cTv
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sT_wKOkV8Gpz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 12:59:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5A8460E27
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5A8460E27
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 12:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660049978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FQ+wwF48ReXy0cBWKcv7V3Cua0LWfPBd2sOCQuW8HDU=;
 b=Q/pG6cTvKoKfUN143fVXN37jjAoHnrRI9T/DG035fdVYHw4KbQEhzVc8QkfgI5ccLdU992
 NIRJqaANBMZNnxDVvJ0EwNftp3FoYn5uLbvZLec8ehziv/FuBcDfcsARGGC9unhS5XZ43R
 ER8Fxkg/wdQX0DAZdsFJdaVziMxR2v0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-bqrbONU1NnGIykcWkFEYgQ-1; Tue, 09 Aug 2022 08:59:38 -0400
X-MC-Unique: bqrbONU1NnGIykcWkFEYgQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 z20-20020a05640235d400b0043e1e74a495so7281719edc.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 09 Aug 2022 05:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=FQ+wwF48ReXy0cBWKcv7V3Cua0LWfPBd2sOCQuW8HDU=;
 b=N5D2YzqKd354JW7uFN6KUnUMx0gY8LbcWmAmzOOB8Wv9j2id7ws+q86hHwmEGQ7dsK
 PjutGHfPSONICoD1vcDO0r50hyVlKw/qMDWn6Qn0DRftBtdfFQQzEnZDCOSXtyb9paaa
 HJ3Tv14NdwRozY8ga85wGcEjuI+HTzuFC0O2U5IiCjHbaGrXDv2YK7huZ9f3Nia9lgQe
 qeSzYCG0aQvgnmO48Zxgq54DpcMzEj44pDWQ6MAKI6IIoezV3XiYUaeDmKonAeYrjQlK
 fybFnNFCHogJ8jR8P4Td4cQ4V+a0Gc02ssFB0yn2MXWQ4+LSZQOGWqshBRHWspAQbHyu
 y1Bw==
X-Gm-Message-State: ACgBeo1a2dkH1G74I5D9iEhcCh4/T6qqVeRaNta55W+0Ol6jQTPRH8VL
 l1cP0KDRwiDfZ3bKuY4xKRaGW2F77STIi+RrDkl91dqyHkCcgqYLIQTUMb6v7Ye3fB72yh5xoO+
 8xdAC6UISGGAi/Zkc+xkcz4LVaxETu8BK7Rcvv1SA+C/VhYDk
X-Received: by 2002:a17:907:7355:b0:730:65bc:e761 with SMTP id
 dq21-20020a170907735500b0073065bce761mr16603422ejc.145.1660049976558; 
 Tue, 09 Aug 2022 05:59:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4aIlognX1ka5VIOyyASxtl2SULJCChbsWiporF7XeJ6dk0ZuPxY+VDmFZOshu2ItIRzk5+cg==
X-Received: by 2002:a17:907:7355:b0:730:65bc:e761 with SMTP id
 dq21-20020a170907735500b0073065bce761mr16603400ejc.145.1660049976349; 
 Tue, 09 Aug 2022 05:59:36 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020aa7c607000000b0043d7ff1e3bcsm6045081edq.72.2022.08.09.05.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 05:59:35 -0700 (PDT)
Message-ID: <397d670c-69c0-8686-e492-06063b7f6621@redhat.com>
Date: Tue, 9 Aug 2022 14:59:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/2] KVM: x86/xen: Initialize Xen timer only once
To: Sean Christopherson <seanjc@google.com>, Coleman Dietsch <dietschc@csp.edu>
References: <20220808190607.323899-2-dietschc@csp.edu>
 <YvGrIRlJThFoLPsb@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YvGrIRlJThFoLPsb@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: x86@kernel.org, kvm@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H . Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 8/9/22 02:32, Sean Christopherson wrote:
> On Mon, Aug 08, 2022, Coleman Dietsch wrote:
>> Add a check for existing xen timers before initializing a new one.
>>
>> Currently kvm_xen_init_timer() is called on every
>> KVM_XEN_VCPU_ATTR_TYPE_TIMER, which is causing the following ODEBUG
>> crash when vcpu->arch.xen.timer is already set.
>>
>> ODEBUG: init active (active state 0)
>> object type: hrtimer hint: xen_timer_callbac0
>> RIP: 0010:debug_print_object+0x16e/0x250 lib/debugobjects.c:502
>> Call Trace:
>> __debug_object_init
>> debug_hrtimer_init
>> debug_init
>> hrtimer_init
>> kvm_xen_init_timer
>> kvm_xen_vcpu_set_attr
>> kvm_arch_vcpu_ioctl
>> kvm_vcpu_ioctl
>> vfs_ioctl
>>
>> Fixes: 536395260582 ("KVM: x86/xen: handle PV timers oneshot mode")
>> Cc: stable@vger.kernel.org
>> Link: https://syzkaller.appspot.com/bug?id=8234a9dfd3aafbf092cc5a7cd9842e3ebc45fc42
>> Reported-by: syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com
>> Signed-off-by: Coleman Dietsch <dietschc@csp.edu>
>> ---
> 
> Reviewed-by: Sean Christopherson <seanjc@google.com>
> 

Queued both (pending resolution of David's question), thanks.

Paolo

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
