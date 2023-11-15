Received: from 2.mo576.mail-out.ovh.net (2.mo576.mail-out.ovh.net [178.33.251.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A744416
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Nov 2023 06:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.1.191])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 5BDAB2A798
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Nov 2023 05:52:54 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-p7h5p (unknown [10.109.156.181])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B9F281FE33;
	Wed, 15 Nov 2023 05:52:52 +0000 (UTC)
Received: from RCM-web6.webmail.mail.ovh.net ([151.80.29.20])
	by ghost-submission-6684bf9d7b-p7h5p with ESMTPSA
	id KK+VK7RcVGUPGyAA34RSKA
	(envelope-from <jose.pekkarinen@foxhound.fi>); Wed, 15 Nov 2023 05:52:52 +0000
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 15 Nov 2023 07:52:52 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 skhan@linuxfoundation.org, airlied@gmail.com, daniel@ffwll.ch,
 Wayne.Lin@amd.com, qingqing.zhuo@amd.com, lyude@redhat.com,
 srinivasan.shanmugam@amd.com, aurabindo.pillai@amd.com,
 sungjoon.kim@amd.com, wenjing.liu@amd.com, mikita.lipski@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] drm/amd/display: fix NULL dereference
In-Reply-To: <689f3862-09d5-448d-b418-fd52d7288106@amd.com>
References: <20231114152751.30167-1-jose.pekkarinen@foxhound.fi>
 <689f3862-09d5-448d-b418-fd52d7288106@amd.com>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <87904eedaf4170e2302450eaa27f57d0@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 45.151.167.10
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6680527099856594625
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudefhedgvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeekhfeguddufeegvdelgedtvdffgeehvddtkeevkeejvedvgeeitdefleehtdeitdenucfkphepuddvjedrtddrtddruddpgeehrdduhedurdduieejrddutddpudehuddrkedtrddvledrvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigrdguvghvpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth

On 2023-11-14 23:01, Hamza Mahfooz wrote:
> On 11/14/23 10:27, José Pekkarinen wrote:
>> The following patch will fix a minor issue where a debug message is
>> referencing an struct that has just being checked whether is null or
>> not. This has been noticed by using coccinelle, in the following 
>> output:
>> 
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:540:25-29: 
>> ERROR: aconnector is NULL but dereferenced.
>> 
>> Fixes: 5d72e247e58c9 ("drm/amd/display: switch DC over to the new DRM 
>> logging macros")
> 
> You only need the first 12 characters of the hash here. I have fixed it
> for you and applied the patch in this case. But, in the future please
> test your patches against `./scripts/checkpatch.pl` before submitting
> them.

     Oops! Sorry I didn't notice! Thanks!

     José.
