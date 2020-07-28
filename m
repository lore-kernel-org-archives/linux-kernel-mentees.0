Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 316E4C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 12:35:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 049122070B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 12:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 049122070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D2C9F87D45;
	Tue, 28 Jul 2020 12:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFwfiYJQvYer; Tue, 28 Jul 2020 12:35:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 075D187D75;
	Tue, 28 Jul 2020 12:35:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0396CC0050;
	Tue, 28 Jul 2020 12:35:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 368AEC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3287E8535D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aCjf4hvvkZCy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:35:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D476680ED2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:35:21 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-138-aKECZJEyMU60G_8cxFq3Wg-1; Tue, 28 Jul 2020 13:35:18 +0100
X-MC-Unique: aKECZJEyMU60G_8cxFq3Wg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 28 Jul 2020 13:35:17 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Tue, 28 Jul 2020 13:35:17 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Peilin Ye' <yepeilin.cs@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Thread-Topic: [Linux-kernel-mentees] [PATCH v2] drm/bufs: Prevent
 kernel-infoleak in copy_one_buf()
Thread-Index: AQHWZNW9oERUOmwTgUadWvPHDViznqkc48JA
Date: Tue, 28 Jul 2020 12:35:17 +0000
Message-ID: <3058d741282b463d8aa7c8aff62e4326@AcuMS.aculab.com>
References: <20200728014343.341303-1-yepeilin.cs@gmail.com>
 <20200728115210.408486-1-yepeilin.cs@gmail.com>
In-Reply-To: <20200728115210.408486-1-yepeilin.cs@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>, Dan
 Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] drm/bufs: Prevent
 kernel-infoleak in copy_one_buf()
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

From: Peilin Ye
> Sent: 28 July 2020 12:52
> Currently `struct drm_buf_desc` is defined as follows:
> 
> struct drm_buf_desc {
> 	int count;
> 	int size;
> 	int low_mark;
> 	int high_mark;
> 	enum {
> 		_DRM_PAGE_ALIGN = 0x01,
> 		_DRM_AGP_BUFFER = 0x02,
> 		_DRM_SG_BUFFER = 0x04,
> 		_DRM_FB_BUFFER = 0x08,
> 		_DRM_PCI_BUFFER_RO = 0x10
> 	} flags;
> 	unsigned long agp_start;
> };
> 
> copy_one_buf() is potentially copying uninitialized kernel stack memory
> to userspace, since the compiler may leave such "holes" (around `.flags`
> and `.agp_start` fields) in this statically allocated structure. Prevent
> it by initializing `v` with memset().
> 
> Cc: stable@vger.kernel.org
> Fixes: 5c7640ab6258 ("switch compat_drm_infobufs() to drm_ioctl_kernel()")
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
> Change in v2:
>     - Improve commit description. (Suggested by Arnd Bergmann
>       <arnd@arndb.de>)
> 
>  drivers/gpu/drm/drm_bufs.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index a0735fbc144b..f99cd4a3f951 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -1349,10 +1349,14 @@ static int copy_one_buf(void *data, int count, struct drm_buf_entry *from)
>  {
>  	struct drm_buf_info *request = data;
>  	struct drm_buf_desc __user *to = &request->list[count];
> -	struct drm_buf_desc v = {.count = from->buf_count,
> -				 .size = from->buf_size,
> -				 .low_mark = from->low_mark,
> -				 .high_mark = from->high_mark};
> +	struct drm_buf_desc v;
> +
> +	memset(&v, 0, sizeof(v));
> +
> +	v.count = from->buf_count;
> +	v.size = from->buf_size;
> +	v.low_mark = from->low_mark;
> +	v.high_mark = from->high_mark;
> 
>  	if (copy_to_user(to, &v, offsetof(struct drm_buf_desc, flags)))
>  		return -EFAULT;

The memset() isn't needed.
The copy_to_user() stops after the 4 'int' values so no 'random'
kernel stack can get copied.

Quite why it is 'right' to leave the remaining part of each
userspace structure unchanged is another matter.

	David.

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
