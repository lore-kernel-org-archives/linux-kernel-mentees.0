Return-Path: <SRS0=3LEE=DC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324BCC4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 06:46:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF4A52083B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 06:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF4A52083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1AFE92E134;
	Fri, 25 Sep 2020 06:46:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qTrGpp25CFg0; Fri, 25 Sep 2020 06:46:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 919392E132;
	Fri, 25 Sep 2020 06:46:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64C7DC0889;
	Fri, 25 Sep 2020 06:46:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02729C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 06:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D7A8086BB3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 06:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lj-nOzumFeyb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 06:46:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 479C986BB2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 06:46:08 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id nw23so2140027ejb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 23:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eYUVlOT19blT7yQ0uNpxiiyC65ymzzyJu/JFbGh28VU=;
 b=Kr/xBaSE0hvjfPa6c6s7ts/Cz2mKbtoAlPFghR/xVKF9+CU0mLkT9nibDtVbmL9dma
 9m8Ueb8j6jy5sqNj+SgdJG0j/eUZwucxpqRFFmhVXmvMqo2qLFLuic5u2L+D5yi2Rb2i
 UpHYR/Q05I9QLTVqDAeywfV1FCU9uCIKIxjwe44/feq9eU2XeRd/M2Ayrzw/e2WL2r/z
 k3ySq40PaR5aKT2ic4SuRsvolq23NmV0pHe1YIRQHULQ+RQdebAHpjE5PKSZaR/vY0nK
 4Bx7x/ZZ0cwBZ9hxn7ovRUC+Tvce8gRXGQ0J+vYvP+kggAVAO5aLA8XMKB06EvtTcwvm
 S5gw==
X-Gm-Message-State: AOAM533JJSxFQG4Bfd4i5l2ZWtH9qAOiIjPzSfaT7dYfYXnvLCj4mJGK
 C0URwaRbFcg/YIqjqrGzfcw=
X-Google-Smtp-Source: ABdhPJxgebLlwHKK36J+ozJlcSYTuZirtezaJm/YbNIHt6jb6McE2nmJtmt/9E/eEdXLK6mduUzIlg==
X-Received: by 2002:a17:906:119b:: with SMTP id
 n27mr1273157eja.124.1601016366763; 
 Thu, 24 Sep 2020 23:46:06 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id s7sm1210953ejd.103.2020.09.24.23.46.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 23:46:06 -0700 (PDT)
To: Peilin Ye <yepeilin.cs@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
Date: Fri, 25 Sep 2020 08:46:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cover.1600953813.git.yepeilin.cs@gmail.com>
Content-Language: en-US
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 0/3] Prevent out-of-bounds access
 for built-in font data buffers
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

On 24. 09. 20, 15:38, Peilin Ye wrote:
> Hi all,
> 
> syzbot has reported [1] a global out-of-bounds read issue in
> fbcon_get_font(). A malicious user may resize `vc_font.height` to a large
> value in vt_ioctl(), causing fbcon_get_font() to overflow our built-in
> font data buffers, declared in lib/fonts/font_*.c:
> 
> (e.g. lib/fonts/font_8x8.c)
> #define FONTDATAMAX 2048
> 
> static const unsigned char fontdata_8x8[FONTDATAMAX] = {
> 
>         /* 0 0x00 '^@' */
>         0x00, /* 00000000 */
>         0x00, /* 00000000 */
>         0x00, /* 00000000 */
>         0x00, /* 00000000 */
>         0x00, /* 00000000 */
>         0x00, /* 00000000 */
>         0x00, /* 00000000 */
>         0x00, /* 00000000 */
>         [...]
> 
> In order to perform a reliable range check, fbcon_get_font() needs to know
> `FONTDATAMAX` for each built-in font under lib/fonts/. Unfortunately, we
> do not keep that information in our font descriptor,
> `struct console_font`:
> 
> (include/uapi/linux/kd.h)
> struct console_font {
> 	unsigned int width, height;	/* font size */
> 	unsigned int charcount;
> 	unsigned char *data;	/* font data with height fixed to 32 */
> };
> 
> To make things worse, `struct console_font` is part of the UAPI, so we
> cannot add a new field to keep track of `FONTDATAMAX`.

Hi,

but you still can define struct kernel_console_font containing struct
console_font and the 4 more members you need in the kernel. See below.

> Fortunately, the framebuffer layer itself gives us a hint of how to
> resolve this issue without changing UAPI. When allocating a buffer for a
> user-provided font, fbcon_set_font() reserves four "extra words" at the
> beginning of the buffer:
> 
> (drivers/video/fbdev/core/fbcon.c)
> 	new_data = kmalloc(FONT_EXTRA_WORDS * sizeof(int) + size, GFP_USER);

I might be missing something (like coffee in the morning), but why don't
you just:
1) declare struct font_data as
{
  unsigned sum, char_count, size, refcnt;
  const unsigned char data[];
}

Or maybe "struct console_font font" instead of "const unsigned char
data[]", if need be.

2) allocate by:
  kmalloc(struct_size(struct font_data, data, size));

3) use container_of wherever needed

That is you name the data on negative indexes using struct as you
already have to define one.

Then you don't need the ugly macros with negative indexes. And you can
pass this structure down e.g. to fbcon_do_set_font, avoiding potential
mistakes in accessing data[-1] and similar.

thanks,
-- 
js
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
