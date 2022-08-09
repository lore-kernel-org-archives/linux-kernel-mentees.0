Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5457FC25B07
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 Aug 2022 14:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6A68409EC;
	Tue,  9 Aug 2022 14:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6A68409EC
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oDtJsLEQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cVjyxbS-25MK; Tue,  9 Aug 2022 14:07:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 391B54091A;
	Tue,  9 Aug 2022 14:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 391B54091A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D51DC0033;
	Tue,  9 Aug 2022 14:07:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D813C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 14:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC31C605D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 14:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC31C605D8
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20210112 header.b=oDtJsLEQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5bfTYYoNteu5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 14:07:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C4DC605A6
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C4DC605A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 14:07:35 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id w14so11422569plp.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 09 Aug 2022 07:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=NnEsu78UdgWUFfbUzx2FaqG+fLzRYJgztuHCMcvogJA=;
 b=oDtJsLEQQYL30wcvIv5F3ooBK0Zf/9c8h4+kW5/jz5Nl67dgnb73eDU7C8tmnt4nYY
 cCMyJmMxEiHiWPNM5WQB2io2rxq9bgmB+TaseJV90fL2r3xfh5kJ6m5B6y7/BiuHZEc2
 xde5cBI2o6E657tDSS6U8BOe2jW6sBWiX9XXvh65MlJJUS7AaWOV4KvFfxIIfmZCuNwc
 oOoe0EJLXJhc0M3MGpwUWJQ1cAhegx+jjeoZ433VUWG15wBgZfP+Bpz4F5TPaAVFcv1G
 xIwBkATQVJVHWkK6kqQjZYTL5Jpf+PTD6HmUUJaV9clHvHt2RUqA3nIziuDGmoL3H5PH
 aSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=NnEsu78UdgWUFfbUzx2FaqG+fLzRYJgztuHCMcvogJA=;
 b=xVGhC66w0/jzPQsbwEyiY9FOFlusKa3tBXYHQe1d1Y5magk98Xp38Syqp7OiClj0d7
 BTPI3gtPPlxfLkWvGNo9aRzJmPjfS7SijVtHtfFJ8n7Y+ej7wYG5tuJSm+ZSe6lbh1gD
 W0EqdlWeR+hwjkWs4bDLKeSApXDesvwe/g3z6qdcIP+uxTdCT+y07Y4SpkiLTN2qXNKi
 BmGCsdRcO6qrzwJeypfKVQTZKAzTDzIv6Vrb+xYKZXSykebzPjkuyDHvtBFVFa86lPke
 egCM+xUUk/+t32R0nGXO7cWD50lW6i3OCuydFGnh5DYl8nqPLf+Kfbluil3XV5Bd+uiO
 vB+Q==
X-Gm-Message-State: ACgBeo00wzGeT5BQLNC1uHMjd9HIlC8FBD03nwuOTtc4xqalR+Mf/vuy
 0LB+rxWxE35wUO5jaCP4moR9Wg==
X-Google-Smtp-Source: AA6agR4aiTL+Daci9AK1TqyyNVqT0wIL4ZZnOZ8/yvhfKaMJTNse+c98EGQik7SdrsdREq1iYR++YQ==
X-Received: by 2002:a17:902:b903:b0:170:9964:b47b with SMTP id
 bf3-20020a170902b90300b001709964b47bmr12764209plb.83.1660054055288; 
 Tue, 09 Aug 2022 07:07:35 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 c14-20020a170902d48e00b0017086b082c1sm8154199plg.173.2022.08.09.07.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 07:07:34 -0700 (PDT)
Date: Tue, 9 Aug 2022 14:07:30 +0000
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v3 2/2] KVM: x86/xen: Stop Xen timer before changing IRQ
Message-ID: <YvJqIsQsg+ThMg/C@google.com>
References: <20220808190607.323899-2-dietschc@csp.edu>
 <20220808190607.323899-3-dietschc@csp.edu>
 <c648744c096588d30771a22efa6d65c31fffd06c.camel@infradead.org>
 <43e258cc-71ac-bde4-d1f8-9eb9519928d3@redhat.com>
 <4fc1371b83001b4eed1617c37bec6b9d007e45c2.camel@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4fc1371b83001b4eed1617c37bec6b9d007e45c2.camel@infradead.org>
Cc: x86@kernel.org, kvm@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H . Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
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
From: Sean Christopherson via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Aug 09, 2022, David Woodhouse wrote:
> On Tue, 2022-08-09 at 14:59 +0200, Paolo Bonzini wrote:
> > On 8/9/22 11:22, David Woodhouse wrote:
> > > On Mon, 2022-08-08 at 14:06 -0500, Coleman Dietsch wrote:
> > > > Stop Xen timer (if it's running) prior to changing the IRQ vector and
> > > > potentially (re)starting the timer. Changing the IRQ vector while the
> > > > timer is still running can result in KVM injecting a garbage event, e.g.
> > > > vm_xen_inject_timer_irqs() could see a non-zero xen.timer_pending from
> > > > a previous timer but inject the new xen.timer_virq.
> > > 
> > > Hm, wasn't that already addressed in the first patch I saw, which just
> > > called kvm_xen_stop_timer() unconditionally before (possibly) setting
> > > it up again?
> > 
> > Which patch is that?
> 
> The one I acked in
> https://lore.kernel.org/all/9bad724858b6a06c25ead865b2b3d9dfc216d01c.camel@infradead.org/

It's effectively the same patch.  I had asked Coleman to split it into two separate
patches: (1) fix the re-initialization of an active timer bug and (2) stop the active
timer before changing the vector (this patch).
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
