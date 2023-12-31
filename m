Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82FD23D9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c9wxMU4w"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3067D607C0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3067D607C0
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c9wxMU4w
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54wfbqW2FIAB
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 31 Dec 2023 09:39:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2CFD260783
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CFD260783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704015595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p00vxKoEMhQVOKsnT5oQD5pn/y7oPEGUmKyIbH6tSV4=;
	b=c9wxMU4w0vE6Rkdt4xSIcV96Co0WxySPgeja5bMOHiGVnbbBP+LkKtrXreSstm2ewWu+G2
	ICuDziAwLVV9tVcmmPSjG5yLJFyuQlikRdpjRM61AcyqveeO4Ee0mDPjily3Wl4pLdWAAb
	Q07c+5Xv+JLXjMwdNMDH/0aFiQ2M5Ew=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-yvhXcI18O0ikyiUGrdfM5w-1; Sun, 31 Dec 2023 04:39:53 -0500
X-MC-Unique: yvhXcI18O0ikyiUGrdfM5w-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-547dd379955so4465835a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 01:39:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704015592; x=1704620392;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p00vxKoEMhQVOKsnT5oQD5pn/y7oPEGUmKyIbH6tSV4=;
        b=Xows6aY1YOdUFlM88SieWaNOWB2X1I6jpde1PdlrccU85fALOhwB9K/deJRwkQPK1I
         qcSd3J2SnZSRlwsxC4j04RQlmeZcaRV1Nd0ykmSskkNxakOygzG2dIBhL+xGmqkitwsx
         7rdDlLuykKd7/W/fGwEz4/Gm24GwwArhX0i4VKm4VWhGmwdplBeffVAhrJu3ml6MWnCv
         6NCekc2PzPeCKd5e58+FjRnfUqCko2fGDL2GnNzQ1EE0RRw3ZBt3Is8IU2EOWJel55Zm
         cDjk0dxCq0aEL20UHbIYzFJXuB5aVjSb6bfMwKH1Twd//4QcWqUAkRPO1+Lna9BaW3/b
         AcTQ==
X-Gm-Message-State: AOJu0Yztp4y2/XMwRSDsUnvU7Un0V+eMbGsR1f+Y8xLTJfbEGS0wLxmy
	sie9EwrZgIbdCBiagRkSBdrz7qsRBJbGMZ4KUihVvd/RVASgcXAPXGjHKqthwf8zE/6JoCQmtHi
	rbJ9gzwZ9z4fO6PuqHYEl4c3cC9mxzAf5jS/i6c02O9uPoTNZBSo/XusM
X-Received: by 2002:a50:f60d:0:b0:555:dc5f:101d with SMTP id c13-20020a50f60d000000b00555dc5f101dmr1016779edn.8.1704015592075;
        Sun, 31 Dec 2023 01:39:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9CSLi4539eGxiNxHCoTLDGqxn9HxSGEP8UxUiNunjYCYJMKg4e61V+O2clbJz5YKv2iw6vQ==
X-Received: by 2002:a50:f60d:0:b0:555:dc5f:101d with SMTP id c13-20020a50f60d000000b00555dc5f101dmr1016778edn.8.1704015591859;
        Sun, 31 Dec 2023 01:39:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ew10-20020a056402538a00b005546ba152f4sm10900308edb.71.2023.12.31.01.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:39:51 -0800 (PST)
Message-ID: <577086e4-c641-467e-b915-37d4ecfedb55@redhat.com>
Date: Sun, 31 Dec 2023 10:39:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: atomisp: pci: Fix spelling mistake in
 isp2400_input_system_global.h
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231222201503.2337-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231222201503.2337-1-kdipendra88@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/22/23 21:15, Dipendra Khadka wrote:
> The script checkpatch.pl reported a spelling error
> in isp2400_input_system_global.h as below:
> 
> '''
> WARNING: 'upto' may be misspelled - perhaps 'up to'?
> //MIPI allows upto 4 channels.
>               ^^^^
> '''
> 
> This patch corrects a spelling error,
> changing "upto" to "up to".
> 
> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/pci/isp2400_input_system_global.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
> index 61f23814e2fd..3ff61faf0621 100644
> --- a/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
> +++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
> @@ -19,7 +19,7 @@
>  #define		N_CSI_PORTS (3)
>  //AM: Use previous define for this.
>  
> -//MIPI allows upto 4 channels.
> +//MIPI allows up to 4 channels.
>  #define		N_CHANNELS  (4)
>  // 12KB = 256bit x 384 words
>  #define		IB_CAPACITY_IN_WORDS (384)

