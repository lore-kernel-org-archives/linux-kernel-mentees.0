Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D64EC19F2D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 Aug 2022 12:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2482F60E63;
	Tue,  9 Aug 2022 12:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2482F60E63
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ThQcu0VZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zOtt12Vur_Ld; Tue,  9 Aug 2022 12:59:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 33B6A60E39;
	Tue,  9 Aug 2022 12:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33B6A60E39
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FCDCC0033;
	Tue,  9 Aug 2022 12:59:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96395C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 12:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 700A4408F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 12:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 700A4408F8
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ThQcu0VZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ts2z9B6oNEyu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 12:59:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 340CD408E8
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 340CD408E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 12:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660049957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KBecFOB/Bo1T/mXz5cBJlBh2olRYpsGjGSOjfij+x2Q=;
 b=ThQcu0VZyiCzKArVlUkNAUlUPwnoQoCPOUJUkwVAem9NewjJ7erAhdz9MPZEsbxQC6QRmn
 f/dxFEZCEeepvs+mSL6MgVcDwZ6wV8bF3MxqT+YDwrkCKNapAoFnZfmZkSZsD0reN82JZs
 SziPbNyVpIf0I8soEgjZqP3SxtutTDA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-M4TwzVEgNES2bw5Dk-M2XQ-1; Tue, 09 Aug 2022 08:59:15 -0400
X-MC-Unique: M4TwzVEgNES2bw5Dk-M2XQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 gn23-20020a1709070d1700b0073094d0e02cso3465686ejc.20
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 09 Aug 2022 05:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=KBecFOB/Bo1T/mXz5cBJlBh2olRYpsGjGSOjfij+x2Q=;
 b=7944Sq/ELbxyoyd9aIVkSCeO4ey8iB6csU7O/eRdyrC6+nfx+OoEZ1jU3UiACwPJEE
 bHKgE3hhZPbjrqfbUL0b8jhczfsFotQB1vPF9OOWV/JCGr+hyEgPiH4lfpUWRVtX4rMb
 8usardG1ITFXBXMM610brXDHt1kuOIof6K/fjffhXlPTl2sor2k1c5YRRHxwiCQ+Gs04
 CPzGtfXltYKRNvMCxL2aBmz6nSWORH3FhufcqEoFiaeZye8SVPL+ltj358N9fcTqHgn6
 UBD8Gw2RfkeenKybKDAkCAzuMSd2h2oTA9tG6jOHrudvb1pUFD/d5JbO2lCZ4fRAVOfE
 4tjw==
X-Gm-Message-State: ACgBeo3gL2UnmtYYyN7OSC+o/og7WPNr1VQHSm+Fa2VdnQ/7M0d/iZfv
 dUk008rl1X7SY8/4U7Zf4//NGNf4uAcEOB4IBCQg6ah5V4BEXt9Wr2VEphz//LUBKoBCXa5c12U
 GPDYvSJM9PusIaTTyrsWEeDDQO7Ns2SlsIl0j5VOARxCIOZVQ
X-Received: by 2002:a05:6402:1907:b0:43d:e91d:e544 with SMTP id
 e7-20020a056402190700b0043de91de544mr22039365edz.107.1660049954833; 
 Tue, 09 Aug 2022 05:59:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4wUw7Vpw3aM/6l7uafzRR30NIAU8ZjnuvsDJ5chqhOQYeDofcjkztMJTSa6IdTzmsVZH8dFg==
X-Received: by 2002:a05:6402:1907:b0:43d:e91d:e544 with SMTP id
 e7-20020a056402190700b0043de91de544mr22039348edz.107.1660049954607; 
 Tue, 09 Aug 2022 05:59:14 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 b2-20020a1709063ca200b0073095b4b758sm1090273ejh.218.2022.08.09.05.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 05:59:13 -0700 (PDT)
Message-ID: <43e258cc-71ac-bde4-d1f8-9eb9519928d3@redhat.com>
Date: Tue, 9 Aug 2022 14:59:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 2/2] KVM: x86/xen: Stop Xen timer before changing IRQ
To: David Woodhouse <dwmw2@infradead.org>, Coleman Dietsch
 <dietschc@csp.edu>, kvm@vger.kernel.org
References: <20220808190607.323899-2-dietschc@csp.edu>
 <20220808190607.323899-3-dietschc@csp.edu>
 <c648744c096588d30771a22efa6d65c31fffd06c.camel@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <c648744c096588d30771a22efa6d65c31fffd06c.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H . Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 8/9/22 11:22, David Woodhouse wrote:
> On Mon, 2022-08-08 at 14:06 -0500, Coleman Dietsch wrote:
>> Stop Xen timer (if it's running) prior to changing the IRQ vector and
>> potentially (re)starting the timer. Changing the IRQ vector while the
>> timer is still running can result in KVM injecting a garbage event, e.g.
>> vm_xen_inject_timer_irqs() could see a non-zero xen.timer_pending from
>> a previous timer but inject the new xen.timer_virq.
> 
> Hm, wasn't that already addressed in the first patch I saw, which just
> called kvm_xen_stop_timer() unconditionally before (possibly) setting
> it up again?

Which patch is that?

Paolo

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
