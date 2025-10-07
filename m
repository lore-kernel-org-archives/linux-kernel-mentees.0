Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183811A9FA4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 07:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759823122; cv=none; b=appAWHz8BITEm7uTJZyrGJ4RqqkTL32Ka+hHiaB4eLN+ALI5Qpjp2lZStPJ/9mm+sxZLoSM6bEVzQQSrEa9rDby2IFf38V5oQsC/uvQRDdxFuYdeAci0Zwuo4GLVnKmAWGmYY/3P8t+qczkTlaQSuHwFf1Tuo773IKqkUQarjlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759823122; c=relaxed/simple;
	bh=9ZL0YHstmePpv73/xy87ZsZcwYt4SHxcvbcuKjIDo7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Lpnio/VfyWgwLIZf5+Z1Q2xC4+fiC6810zs8Mkqz8RCTgfVIpNgySyc83SBpDWWWZn4F+h26f2FuStZBgz43DDTVyZuv2kYchN4Te6qhoVY2rrgf2Z3TChm3BPyUqsBV+KZPn4qQtZ6OZdjP+rzt0uAkrysQEy03s0y0LhoA9Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ootvMOaN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pgV1xSI6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qRxTbahw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2GoEhmf9; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ootvMOaN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pgV1xSI6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qRxTbahw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2GoEhmf9"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9CA7616A4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 07:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.091
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szBdEP_tcoNx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Oct 2025 07:45:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 59E746158F
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=suse.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59E746158F
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ootvMOaN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pgV1xSI6;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qRxTbahw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=2GoEhmf9
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 59E746158F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 07:45:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3AE7C21E42;
	Tue,  7 Oct 2025 07:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759823117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=La4BDc6ldcA95P7zvpVH5kYpUb90c/aRZmTFms3sJzs=;
	b=ootvMOaNnqTbIBmgP+Qvs2YWbQdicUjqQAHqq3kouYpYnksWZZOOk6Q0d0oAV4X1J/vJmD
	koZ31dfVTOyWmZ9RExIawieMBhehA6iyyczJo9/TXXbQ6SVIxDA1ZvMe63EKT2Q2cfs4CV
	VB6nQNcrC/PCileDnMNX6G9DmVcluTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759823117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=La4BDc6ldcA95P7zvpVH5kYpUb90c/aRZmTFms3sJzs=;
	b=pgV1xSI6bFbagJlshmNUPTFBCrWIuwBa9kBWHSU3ybOktjLPKQ0Oe31vqOYP7dwhYMuBlb
	rWxh84+IBtTZkCCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759823116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=La4BDc6ldcA95P7zvpVH5kYpUb90c/aRZmTFms3sJzs=;
	b=qRxTbahwm8Wf7N9l2m71MzrDpCvb2dD6JjstouTW6SvP71HDk48+NbtEazCWXu95NC3r5w
	Qu5644oI2UrN/q0PJeeLUnpFnkgQK7fMa8MYrK/3Otr/RG8fSsqqrStlzRafP1Jinm2brM
	m5kmQ0zLv46OLqKcLh1al9/+NH72ZC8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759823116;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=La4BDc6ldcA95P7zvpVH5kYpUb90c/aRZmTFms3sJzs=;
	b=2GoEhmf9xczF1dpoMimisfAxVJOKDOd8w5raPRwQ52VSTOa78W2u2zety8S+8XPmPgrNNt
	3Wf3w1yMO/b9XrDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BB55F13693;
	Tue,  7 Oct 2025 07:45:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QudLLAvF5GiaLQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 07 Oct 2025 07:45:15 +0000
Message-ID: <26036ff3-2374-40a9-8597-271b93130a7e@suse.de>
Date: Tue, 7 Oct 2025 09:45:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/gud: Use kmalloc_array() instead of kmalloc()
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, mingo@kernel.org, tglx@linutronix.de, jfalempe@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, rubenru09@aol.com
References: <20250923085144.22582-1-mehdi.benhadjkhelifa@gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20250923085144.22582-1-mehdi.benhadjkhelifa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch,linutronix.de,redhat.com,lists.freedesktop.org,vger.kernel.org,lists.linuxfoundation.org,linuxfoundation.org,aol.com];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[aol.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]

Hi

Am 23.09.25 um 10:51 schrieb Mehdi Ben Hadj Khelifa:
> Replace kmalloc with kmalloc array in drm/gud/gud_pipe.c since the
> calculation inside kmalloc is dynamic 'width * height' to avoid
> overflow.
>
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> ---
> Changelog:
>
> Changes since v1:
> - Use of width as element count and height as size of element to
> eliminate the mentionned calculation and overflow issues.
>
>   drivers/gpu/drm/gud/gud_pipe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
> index 8d548d08f127..8898dc9393fb 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -70,7 +70,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
>   	height = drm_rect_height(rect);
>   	len = drm_format_info_min_pitch(format, 0, width) * height;
>   
> -	buf = kmalloc(width * height, GFP_KERNEL);
> +	buf = kmalloc_array(width, height, GFP_KERNEL);

One nitpick here: the first parameter is the number of elements and the 
second parameter is the size of an individual element. [1] So the 
arguments 'width' and 'height' should be reversed.  Please resubmit.

Best regards
Thomas

[1] 
https://elixir.bootlin.com/linux/v6.17.1/source/tools/include/linux/slab.h#L15

>   	if (!buf)
>   		return 0;
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


