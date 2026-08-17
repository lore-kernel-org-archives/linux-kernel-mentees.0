Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C0C345EA2
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Aug 2026 21:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787002167; cv=none; b=QxdC9jxyqsZ0rToaLTipXs2De7npDt23QvxvtGDW2ATPRuWFe4vlVmgXCUriaLbr6JfRiIvyBjCU0/7ClvkFHmSs+pYSp3eQftdwghTJQIcmRO6GJTI1wU2KqqYCqzig/0ftzpsHjWFcwKqBipuxJpN2yUxcFFswvx+i/HDH1xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787002167; c=relaxed/simple;
	bh=RRjYjO9utSwXFNiNlGy5THKzfGm+sRKB/dDa4OjFrtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IOYxihe+1+Om2Dk2bnEfmfyLhKBU3oWCM9bOW7qgUUiDZTPdwbJh1AN4P3f499xRduOimKFEwhCt/Pm5Fd3zdofIjXqHDNTgLiAkv4QY22Z2Hky5Ghmmkw3Wy/d9v9J1+qeQb3Y4/fxYduS/82hh90eRxsPiWErk2GLvZLRJaVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEuxQZ6I; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEuxQZ6I"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfaa014978so1513925e0c.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Aug 2026 14:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787002165; x=1787606965; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XiXCkGd4+m7MSxEiROxY/FH+NnJuFc43Sy6i9qtL4cg=;
        b=GEuxQZ6IMewcMIsAtYNPKIgs7M+vCQoOra33YywjaDfJjWavt9ITDvQyLOIpWb93bQ
         afKdp5sxGQXteLs7FmcZlK1Ydwe2G8zBnxkjrnnm73cDPXHqiU7svcZOhVdOdx5M3QVU
         ommisvfYgZp9b6UpwKD2Dm3UJdsPxdfezY5R0ctpluO/iAgH2bcLq+IiQ69vIvADGB8l
         nlg3GZtaHcqlQunDwWs0NNvr/XVwG+DvGo7iyL55u+THu8mzGNstBW9t6IQQfjXnVsGz
         ZzQkh3Q/pnPjoaZ51+wt2xIvX1kEKT4orHqs+ORG5BWI8thYabY58iouh+Grqln/EySw
         la5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787002165; x=1787606965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XiXCkGd4+m7MSxEiROxY/FH+NnJuFc43Sy6i9qtL4cg=;
        b=EJJ9sN93JrnN/wlE5Hj09Y0l+nmNUfDcKQxw144ggUU12JEjeHSTFrETqvYr9eQS0c
         s4ckqSXi7fZF70uIQQXk2hrYqqYG96ltaLQhfc1oj2ESk8UEhJPsO2YvXxPsr01yFOu/
         hx0qn+33jrpKnSvKoco9hSKuSz8pHxT8nrbDMDmsyadC3CIQ9+5jZKHThdcKXNlkVEsQ
         bKS9IzL9DNuovW/hBGDYQoQKGydwY8TvIcOM0j9eY330hDi96flwcgXxL6XDJo+rHjfe
         /4MtzEHW9KaqSM66btzMjwQT+ZA3PJfrw+Xx8rn7G07xXqrVvD1EXX72bLvYBhQb/1IP
         V1NQ==
X-Forwarded-Encrypted: i=1; AHgh+Rql2o52aIfGn0AzuQS1OJYZEv3QIVy4Zti9tjJmvQ7o2JtbDwXOWk6KIPZg0zmhfnDrXzhyI4ER8PnQly8xDcTTjxWHJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMaffpnweTW83wyVBp3MF8FwEMKliYn5vbdxL6Mv/8TjXOCG+k
	G1nydQTxaamI0ol/VHxhkH/EVXlNsQb9PsdHNRKbG9zMnJ4eUpuK23kY
X-Gm-Gg: AR+sD13TX79SAC4+KhErI/AamGm7DAF3a/i2BcuBJ1d5kIjWjti6mgx8WPr0sCFV1hy
	HNBD9NP7qXQy/1TzIY4bGSVnnR7QXe8FwOsVS0NscFAr+MsjasY1p7cbqAoiUi4u/cabT6aSiNv
	Y80cn562Ursod9ie7BZTZ3+SJE5kdQJ+0bSY9xsgDYLVJoMomLXeNJTQe9rFc4C+PdHKdSrqy5K
	GNot6atyMGtzH5hF6I9DK2TZuXfvgjw6K5EHGWZMaKkxMJ7E2fRV08P1wdYA+259KY+HGqN74O6
	7nEZ04MooAvwq3BuxFwkC9LGsOAgkT2aasx67ML+7BYKYVpltGue0cCsOmLLNuyekUrNrjnv4Hm
	cOTZt30vuezezDzV6rsyGqOG6umTAcQU61jQvmRrjS86ox5Re25Vf8qFigC+24qSO9aqPpX4z+S
	XCI8uM7jZ0kVExXX++/5rdzrwbhbs6JEO1XbpkEFcZYJEkxun6AYJXeYcZVtwMgUVIlsLQYsDpZ
	pCJCKAa2nDZv9cBQ903NlaQ5bqZtgC2f1zErCCkBYkLJURlU7a1ngZU1iSE/bsdryofYQ2G
X-Received: by 2002:a05:6102:6898:b0:738:1fcb:f276 with SMTP id ada2fe7eead31-7747c0b68c9mr783524137.1.1787002165013;
        Mon, 17 Aug 2026 14:29:25 -0700 (PDT)
Received: from ?IPV6:2804:14d:4c64:82a2:de83:b808:5922:82d? ([2804:14d:4c64:82a2:de83:b808:5922:82d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5c78eef7asm1683621e0c.16.2026.08.17.14.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 14:29:24 -0700 (PDT)
Message-ID: <9f0a6334-f40c-4e19-928f-57b709bbcea9@gmail.com>
Date: Mon, 17 Aug 2026 18:29:17 -0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: iio: proximity: move LIDAR-Lite v2
 out of trivial-devices
To: Matt Ranostay <matt@ranostay.sg>, Jonathan Cameron <jic23@kernel.org>
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mranostay@gmail.com, ~lkcamp/patches@lists.sr.ht,
 linux-kernel-mentees@lists.linux.dev, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260810192131.153495-1-rodrigo.gobbi.7@gmail.com>
 <20260810192131.153495-2-rodrigo.gobbi.7@gmail.com>
 <20260812053450.2e14b074@jic23-huawei>
 <F_gQH7S7C_a2e4gmKfLMZwNzMQ2lvOoBcv-tqJsuNGsWYdJdV-KhzKRPTqo1JS4yGoBK6bn4lscAS3et1Uxm-obr7Tjw3hzePjHOllpSlc4=@ranostay.sg>
Content-Language: en-US
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
In-Reply-To: <F_gQH7S7C_a2e4gmKfLMZwNzMQ2lvOoBcv-tqJsuNGsWYdJdV-KhzKRPTqo1JS4yGoBK6bn4lscAS3et1Uxm-obr7Tjw3hzePjHOllpSlc4=@ranostay.sg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/12/26 07:11, Matt Ranostay wrote:

>> >
>> > diff --git a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
>> > new file mode 100644
>> > index 000000000000..e19c8d166b81
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
>> > @@ -0,0 +1,64 @@
>> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> > +%YAML 1.2
>> > +---
>> > +$id: http://devicetree.org/schemas/iio/proximity/pulsedlight,lidar-lite-v2.yaml#
>> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> > +
>> > +title: Pulsedlight LIDAR-Lite v2 range-finding sensor
>> > +
>> > +maintainers:
>> > +  - Matt Ranostay <mranostay@gmail.com>
> 
> I really don't use my gmail address anymore. Would be ideal if it was changed matt@ranostay.sg 
> Other than that don't have any issues.
> 
> Thanks,
> 
> Matt

Thanks Matt, I will send a v6 fixing the e-mail. Since you're fine with it, would you
mind sending a formal Reviewed-by/Acked-by?

> 
> 
>> I'll need an Ack or Reviewed-by from Matt for this. If Matt either doesn't
>> reply for a while, or isn't happy to take on this much fuller binding,
>> is it something you'd consider putting yourself down for?
>> 
>> Otherwise LGTM
>> 
>> Thanks,
>> 
>> Jonathan

I'm happy to be added as a second maintainer for this binding,
(I can add myself at v6) but I'd rather defer to Matt as the
primary one for now.
Thanks!
Rodrigo.
