Return-Path: <SRS0=qmss=MO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B15C63793
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 10:36:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4057A60FED
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 10:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4057A60FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03566605CC;
	Thu, 22 Jul 2021 10:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iPK2DtIa0eO0; Thu, 22 Jul 2021 10:36:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4370E6059B;
	Thu, 22 Jul 2021 10:36:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 145BBC001A;
	Thu, 22 Jul 2021 10:36:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E8FEC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 10:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F5384013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 10:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o1a8ov3SrmLJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 10:35:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08D98400CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 10:35:58 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id c17so7620188ejk.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 03:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=GrVJiLCQ2td0LvFK6G+f6bTrOT7qBQ9CowikA35mI6k=;
 b=MPLRAuRMQscjJ1bRSPG4VJjStt0rZUgJLQkjV8Ee74n4JK+gKsZ7E7GbremKpAbXEa
 5RSfjjBngX0otVhG9sMSkQLeikaSoPGMoGGqC4NPQ/xZwSIJGc3C3qKQAjXJzoqHtrnc
 PPUUoOevWpVg4MQ3t0pqVrvjBRHgXApPIqqX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=GrVJiLCQ2td0LvFK6G+f6bTrOT7qBQ9CowikA35mI6k=;
 b=fVPpBY0jZR1vUa8o7+OwogKva6ObhUqL98FCteIwke1yzS1TjF4Dw5H4dHmchg/l4b
 1j5R2iKswfBJIu5FlB0Vw1c5b3wFvxI6WkCuzRmeUuw621sjux4RXOpDWEzjiaCKarux
 4p9WdiPkvpw6X7JqLyjE7D846a5SDhtcEtynlNMS8BBQO+nln6ZAPZAiuUDYzcT+b2iV
 6ifsphD+TSPSey+66EKFdFtQOScRlD4lb54RCocVCzDjNLF/k2uawB8a+lsztgz0Thon
 73Iby0+r15b5rO0J7JY/kZ6Xc22SxZOJf+1W42SoB1XYGiaq1VABGTBOg4Ff/BNSKCBw
 XNvA==
X-Gm-Message-State: AOAM533SAZYnITTHpSf2YdIpStap7wcjTcS/EoWCDCXszecHFQQA2C5o
 15P5fhuo/JW6qrx5QnKWNBFs/w==
X-Google-Smtp-Source: ABdhPJzNq6lAT9fVXCqbmiOVhh6CzSJjtq8+tM+DSHEpE5WiLhtvjojRagf8CYVO6eOi+rS6ouALzA==
X-Received: by 2002:a17:906:990f:: with SMTP id
 zl15mr43047702ejb.34.1626950156329; 
 Thu, 22 Jul 2021 03:35:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i6sm9257113ejr.68.2021.07.22.03.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 03:35:55 -0700 (PDT)
Date: Thu, 22 Jul 2021 12:35:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH 2/3] drm: clarify lifetime/locking for drm_master's lease
 fields
Message-ID: <YPlKCc7Sep71xjBC@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
 <20210722092929.244629-3-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722092929.244629-3-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Cc: tzimmermann@suse.de, airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 linux-kernel-mentees@lists.linuxfoundation.org, zackr@vmware.com
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

On Thu, Jul 22, 2021 at 05:29:28PM +0800, Desmond Cheong Zhi Xi wrote:
> In particular, we make it clear that &drm_device.mode_config.idr_mutex
> protects the lease idr and list structures for drm_master. The lessor
> field itself doesn't need to be protected as it doesn't change after
> it's set in drm_lease_create.
> 
> Additionally, we add descriptions for the lifetime of lessors and
> leases to make it easier to reason about them.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>  include/drm/drm_auth.h | 62 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 51 insertions(+), 11 deletions(-)
> 
> diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
> index f99d3417f304..c978c85464fa 100644
> --- a/include/drm/drm_auth.h
> +++ b/include/drm/drm_auth.h
> @@ -58,12 +58,6 @@ struct drm_lock_data {
>   * @refcount: Refcount for this master object.
>   * @dev: Link back to the DRM device
>   * @driver_priv: Pointer to driver-private information.
> - * @lessor: Lease holder
> - * @lessee_id: id for lessees. Owners always have id 0
> - * @lessee_list: other lessees of the same master
> - * @lessees: drm_masters leasing from this one
> - * @leases: Objects leased to this drm_master.
> - * @lessee_idr: All lessees under this owner (only used where lessor == NULL)
>   *
>   * Note that master structures are only relevant for the legacy/primary device
>   * nodes, hence there can only be one per device, not one per drm_minor.
> @@ -88,17 +82,63 @@ struct drm_master {
>  	struct idr magic_map;
>  	void *driver_priv;
>  
> -	/* Tree of display resource leases, each of which is a drm_master struct
> -	 * All of these get activated simultaneously, so drm_device master points
> -	 * at the top of the tree (for which lessor is NULL). Protected by
> -	 * &drm_device.mode_config.idr_mutex.
> +	/**
> +	 * @lessor:
> +	 *
> +	 * Lease holder. The lessor does not change once it's set in

Lessor is the lease grantor, lessee is the one receiving the lease. Maybe
clarify this with

"Lease grantor, only set if this struct drm_master represents a lessee
holding a lease of objects from @lessor. Full owners of the device have
this set to NULL."

> +	 * drm_lease_create(). Each lessee holds a reference to its lessor that

I also figured it'd be a good idea to link to the drm_lease docs here to
explain the concepts, but alas we don't have those :-( Hence at least
define what we mean with lessor, lessee, lease and owner.

> +	 * it releases upon being destroyed in drm_lease_destroy().
> +	 *
> +	 * Display resource leases form a tree of &struct drm_master. All of

For now we've limited the tree to a depth of 1, you can't create another
lease if yourself are a lease. I guess another reason to update the
drm_lease.c docs.

So maybe add "Currently the lease tree depth is limited to 1."

> +	 * these get activated simultaneously, so &drm_device.master
> +	 * points at the top of the tree (for which lessor is NULL).
>  	 */
> -
>  	struct drm_master *lessor;
> +
> +	/**
> +	 * @lessee_id:
> +	 *
> +	 * ID for lessees. Owners always have ID 0. Protected by

Maybe clarify to "Owners (i.e. @lessor is NULL) ..."

> +	 * &drm_device.mode_config's &drm_mode_config.idr_mutex.
> +	 */
>  	int	lessee_id;
> +
> +	/**
> +	 * @lessee_list:
> +	 *
> +	 * List of lessees of the same master. Protected by

We try to distinguis between list entries and the list, even though it's
the same struct. So maybe

"List entry of lessees of @lessor, where they are linked to @lessee. Not
use for owners."

> +	 * &drm_device.mode_config's &drm_mode_config.idr_mutex.

> +	 */
>  	struct list_head lessee_list;
> +
> +	/**
> +	 * @lessees:
> +	 *
> +	 * List of drm_masters leasing from this one. Protected by
> +	 * &drm_device.mode_config's &drm_mode_config.idr_mutex.
> +	 *
> +	 * This master cannot be destroyed unless this list is empty as lessors
> +	 * are referenced by all their lessees.

Maybe add "this list is empty of no leases have been granted."

> +	 */
>  	struct list_head lessees;
> +
> +	/**
> +	 * @leases:
> +	 *
> +	 * Objects leased to this drm_master. Protected by
> +	 * &drm_device.mode_config's &drm_mode_config.idr_mutex.
> +	 *
> +	 * Objects are leased all together in drm_lease_create(), and are
> +	 * removed all together when the lease is revoked.
> +	 */
>  	struct idr leases;
> +
> +	/**
> +	 * @lessee_idr:
> +	 *
> +	 * All lessees under this owner (only used where lessor is NULL).

@lessor so it's highlighted correctly

> +	 * Protected by &drm_device.mode_config's &drm_mode_config.idr_mutex.
> +	 */
>  	struct idr lessee_idr;
>  	/* private: */

With the nits addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks for updating the docs!
-Daniel

>  #if IS_ENABLED(CONFIG_DRM_LEGACY)
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
