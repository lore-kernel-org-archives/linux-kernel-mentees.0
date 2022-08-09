Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B97EC19F2D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 Aug 2022 14:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9761A60DFC;
	Tue,  9 Aug 2022 14:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9761A60DFC
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DdqJbRdm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yAmPi0ZDLEFy; Tue,  9 Aug 2022 14:32:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9B50B60D52;
	Tue,  9 Aug 2022 14:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B50B60D52
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77DDEC0033;
	Tue,  9 Aug 2022 14:32:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0850C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 14:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 984C460DFC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 14:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 984C460DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id unBA2oHzee0j
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 14:32:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB77C60D52
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB77C60D52
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660055529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BnCnqK3XkuMaWvfU+WTbvm+XzlcWU8Yyqm7Yd0LhLkE=;
 b=DdqJbRdmk8lJDgyZXQN51XoeW+lyChpWs5S2BlTDHkIDoBLsccGV+xVo/HmwZt01PkuW8/
 GLLqOr1p7vXXWEy7ysGGgk+ZpRcqAYExB4WO592XFN1m6UTXbsZ3VaQfQOp4o6EIg8AXmt
 MrdLKTW2xNK2bmxC1cXeiPf/YUzJzsc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-HTzw0gFCPUO9vDaZPRbdAw-1; Tue, 09 Aug 2022 10:32:06 -0400
X-MC-Unique: HTzw0gFCPUO9vDaZPRbdAw-1
Received: by mail-ej1-f69.google.com with SMTP id
 qb27-20020a1709077e9b00b0073160a55fd7so1858482ejc.17
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 09 Aug 2022 07:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=BnCnqK3XkuMaWvfU+WTbvm+XzlcWU8Yyqm7Yd0LhLkE=;
 b=b3d+b9bvZqUNlTHNTTJLXrZnxZI6NjTM/xs5ZtDxpBCZZ0R7eUERAfy0ZLOKT9FhEq
 nbiDkndENFBsEf/xLrcsakznrJFyQmOI/zYBBV5uu46vB2bAPk30AgtNzJT0xIINv8VC
 qNylxIie7lkY1bQMgj3gVRX17v/1Q+BO4QxACTyXe/JFv30E9KPILOVRdlV8WTBCRJmt
 6VhyRITs6uw10xX4k8ZJDP6nbTWfaGB2+Xe/gOWaen1E8Ai80Y6P45PqZ5145Kd5okfx
 kWLOQsBgwDgQ0Y7CjDCW51/vrGpUm2BrHuaqZAGlrp78/dwq630C9RRf7/c1gNgl0+J9
 tmSg==
X-Gm-Message-State: ACgBeo1rFf/nbDRvUuR8D2QZ9Nt2eAzVJ22VZFnY3YMWnidJ9aBQ7b/c
 +mmY03lYrecfERLddIoBBDYnU5XyVc+yGbAMLZvXN/9UDXUpIIdYZCHSuTzSqUdDSOG+iKuDimy
 1/9vD5R1TJuT1B7XpJnLkjHo3gVfUyNbaVw2vFu/lSkoSGwMO
X-Received: by 2002:a17:907:781a:b0:730:cd06:3572 with SMTP id
 la26-20020a170907781a00b00730cd063572mr17474397ejc.487.1660055525246; 
 Tue, 09 Aug 2022 07:32:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5wYRs9LRq936vKKUril1vIXeztDIFofWVQmtrcvT9o55Wcn05sEztvAoT0YGyT1d3Ak9sm9A==
X-Received: by 2002:a17:907:781a:b0:730:cd06:3572 with SMTP id
 la26-20020a170907781a00b00730cd063572mr17474380ejc.487.1660055524915; 
 Tue, 09 Aug 2022 07:32:04 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 r27-20020a056402035b00b0043c92c44c53sm6053094edw.93.2022.08.09.07.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 07:32:03 -0700 (PDT)
Message-ID: <953d2e99-ed1a-384d-6d3a-0f656a243f82@redhat.com>
Date: Tue, 9 Aug 2022 16:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 2/2] KVM: x86/xen: Stop Xen timer before changing IRQ
To: David Woodhouse <dwmw2@infradead.org>,
 Sean Christopherson <seanjc@google.com>
References: <20220808190607.323899-2-dietschc@csp.edu>
 <20220808190607.323899-3-dietschc@csp.edu>
 <c648744c096588d30771a22efa6d65c31fffd06c.camel@infradead.org>
 <43e258cc-71ac-bde4-d1f8-9eb9519928d3@redhat.com>
 <4fc1371b83001b4eed1617c37bec6b9d007e45c2.camel@infradead.org>
 <YvJqIsQsg+ThMg/C@google.com>
 <0b5dcab333906f166fcdbc296373cc5e08bec79f.camel@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <0b5dcab333906f166fcdbc296373cc5e08bec79f.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: x86@kernel.org, metikaya <metikaya@amazon.co.uk>, kvm@vger.kernel.org,
 Pavel Skripkin <paskripkin@gmail.com>,
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

On 8/9/22 16:16, David Woodhouse wrote:
> I find the new version a bit harder to follow, with its init-then-stop-
> then-start logic:
> 
> 	case KVM_XEN_VCPU_ATTR_TYPE_TIMER:
> 		if (data->u.timer.port &&
> 		    data->u.timer.priority != KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL) {
> 			r = -EINVAL;
> 			break;
>                  }
> 
> 		if (!vcpu->arch.xen.timer.function)
> 			kvm_xen_init_timer(vcpu);
> 
> 		/* Stop the timer (if it's running) before changing the vector */
> 		kvm_xen_stop_timer(vcpu);
> 		vcpu->arch.xen.timer_virq = data->u.timer.port;


I think this is fine, if anything the kvm_xen_stop_timer() call could be 
placed in an "else" but I'm leaning towards applying this version of the 
patch.

Paolo

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
