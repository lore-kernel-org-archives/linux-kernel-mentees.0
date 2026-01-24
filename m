Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55C91A9FAB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Jan 2026 07:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769238469; cv=none; b=STv5KgKoyLvkyi1UpxPpk+EtjFQ1GDz8zgVz7eA0j+fL7wcwzctjhiUvrwCnhV1GvGY47zUFScMukbRSsOrc+cWl72yj8cTxrO12USmRu0ALe5eOG5vG1KuJiJl3NrpqWioDRa3lFO5eCq9MdxDUBr6vURxmEA0AuYRZ3HXq6Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769238469; c=relaxed/simple;
	bh=J3zHDYzfTTCt2dU5qEXpmS9XYoXRIWt7rSr+GnITUeA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=VQ4UmwPEA4+k78su2qLkrcuMl8hkoVpakqIRKG2m01enlDmelZXM7SZX3da8fAuzWsQK1Hjs+/4//Eb/NFpaW1avKiY1HXIJayvP7kMadgeTGtLOpvnwcHCi9gYjCjxor4W1IhkqcZy7XPBpXIFP9joL3t2DEsyolIUr29VCCzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LWq7a7v8; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LWq7a7v8"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95EFE60823
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Jan 2026 07:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.795
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qdNmQERdMVu for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jan 2026 07:07:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=gmonaco@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6FA9260707
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FA9260707
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LWq7a7v8
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6FA9260707
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Jan 2026 07:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769238464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J3zHDYzfTTCt2dU5qEXpmS9XYoXRIWt7rSr+GnITUeA=;
	b=LWq7a7v8hfNkiaX+TMW1rbtPQmHHSDDUOuDXjSwgoaUKyb0dzEXnFeyrdGszGyQlaPadk+
	uitbVomfsRY23nxnGKYrwCVuDhvmCo0gTR/Yxy5qsT2Faaq/d6KgtgpXqNyKJeecEzSMzz
	xAjcey1rn9EMROK/Yjnj3ZL4l6BZBgI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-qFMqBf-yPmO-xMN20AVq1g-1; Sat, 24 Jan 2026 02:07:42 -0500
X-MC-Unique: qFMqBf-yPmO-xMN20AVq1g-1
X-Mimecast-MFC-AGG-ID: qFMqBf-yPmO-xMN20AVq1g_1769238461
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47d4029340aso39767345e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 Jan 2026 23:07:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769238461; x=1769843261;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3zHDYzfTTCt2dU5qEXpmS9XYoXRIWt7rSr+GnITUeA=;
        b=lJqpeY98b8qmdHIgxLI/IXxgClu9KSKUf1m2sO6AV6MEYAsnDEBDPjmSNjr5KD7guA
         qqRu11RzPCu+reslaJfd1qL9nhzpGhbEW8sZMy5pcaadUTQKINhBZJGxURBJdBT6QrSU
         DwyQV5z+KSHLCGIFbVxs/tataVCCj0idcOxPkHK0WfPYgz3bSRsICeC/Fk4f0jzVHNyK
         sfi1cHTdT9Tum/unXv8yBnu8oTK95M//1Nzq1vQlu3HXMxEovFEGnYULKbOs4AKRcqpd
         35saiyI+YnXDFnjs8vkE1ZppTeLVBoU6RF2G5Y1K+nIuiDe2pTSuNyPNgodFutqSt099
         tm5Q==
X-Gm-Message-State: AOJu0YyGR3658mv+4FNarB1ydqKGBwF4t2Pn3FINRsMIQzqGQKToVpaX
	1ohWe9XsZa7AadYGVLIok6m5eadwJzjQ9zvjBy+RlYw9PSigEswgqvL/QF/TqLlwgfrZsCUfCwt
	Jp+K+YwF5D0/364PclV8e7K6U+FKx5yFNVLGAKR3MHFBSez+xoUuk/id6iZseIgd0ikcPc4yM92
	pImdGRYX9Uqx1QkA==
X-Gm-Gg: AZuq6aLT/NIUOgd5W+Bc3+OcQ9fORECEzoKZ2kiQhDmemOC3Ao50houiwYvv4xiz+6q
	FNW24RB1O8iZritNSSH2Bgxd8FJbhc592f1MiyNm2H5Hz1lenmvrk96MYp7Ra86iEQqOlRAbxu/
	kYpVumR1CJyXcGPRilismIxt1PqI/qr7igrrJK9UTo296gfQ8MgB6sexHtWycviMIxsQWk1fCUP
	2Fzyi2kH97v49zakypKSSeoU8ZZQhARyTxwlKJBHxjhCHNvwKmC8ZYk6R4teAOHJxPQdPPQfKcw
	pg8jmCeh9t2Z3YYqjyzW+p3tOxQfrVcB6gEFmOTOu+PZT1Ov/Vqcd2LQ2Eyc1i2M/QYSYL1oRue
	IUQnYqg==
X-Received: by 2002:a05:600c:8217:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-4804c9bff60mr82792175e9.28.1769238461385;
        Fri, 23 Jan 2026 23:07:41 -0800 (PST)
X-Received: by 2002:a05:600c:8217:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-4804c9bff60mr82791905e9.28.1769238461003;
        Fri, 23 Jan 2026 23:07:41 -0800 (PST)
Received: from [127.0.0.1] ([195.174.134.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d85cff5sm102409995e9.7.2026.01.23.23.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 23:07:40 -0800 (PST)
Date: Sat, 24 Jan 2026 07:07:39 +0000
From: Gabriele Monaco <gmonaco@redhat.com>
To: Soham Metha <sohammetha01@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, shuah@kernel.org,
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-trace-kernel@vger.kernel.org
Message-ID: <7350432b-f47c-4e9a-baee-b0d7d5dd1770@redhat.com>
In-Reply-To: <c79d4fbd-e9a4-4d73-a650-b01f437a4c0b@gmail.com>
References: <20251203202259.69116-1-sohammetha01@gmail.com> <c79d4fbd-e9a4-4d73-a650-b01f437a4c0b@gmail.com>
Subject: Re: [PATCH] rv: Fix dead link to monitor_synthesis.rst
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Correlation-ID: <7350432b-f47c-4e9a-baee-b0d7d5dd1770@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hD6SJkhs7i1DsR-ac_Q0wIZ8BidcUC4iY6wBLU8bZfE_1769238461
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2026-01-23T20:06:35Z Soham Metha <sohammetha01@gmail.com>:
> On 04/12/25 01:52, Soham Metha wrote:
>> --- a/include/rv/da_monitor.h
>> +++ b/include/rv/da_monitor.h
>> @@ -8,7 +8,7 @@
>> =C2=A0 * The dot2k tool is available at tools/verification/dot2k/
>> =C2=A0 *
>> =C2=A0 * For further information, see:
>> - *=C2=A0=C2=A0 Documentation/trace/rv/da_monitor_synthesis.rst
>> + *=C2=A0=C2=A0 Documentation/trace/rv/monitor_synthesis.rst
>> =C2=A0 */
> Hi,
>
> Just a gentle ping on this documentation patch in case it was missed.
> Please let me know if any changes are needed.

Hi Soham,

the same change was included in [1], which is already on linux-next.
I think I missed your patch since it apparently arrived first.

Thanks anyway,
Gabriele

[1] - https://lore.kernel.org/lkml/20251230075337.11993-1-slopixelz@gmail.c=
om

