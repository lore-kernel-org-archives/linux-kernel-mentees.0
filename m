Received: from 6.mo560.mail-out.ovh.net (6.mo560.mail-out.ovh.net [87.98.165.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AEC328C2
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Nov 2023 17:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.20.212])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 9EEC321CBB
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Nov 2023 17:07:16 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-2xd47 (unknown [10.110.171.144])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 97EB71FE72;
	Tue,  7 Nov 2023 17:07:15 +0000 (UTC)
Received: from RCM-web9.webmail.mail.ovh.net ([151.80.29.21])
	by ghost-submission-6684bf9d7b-2xd47 with ESMTPSA
	id XCnmJMNuSmUKdgAAOnoGkA
	(envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 07 Nov 2023 17:07:15 +0000
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 07 Nov 2023 19:07:15 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 skhan@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Bhawanpreet.Lakha@amd.com, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] drm/amd/display: clean up redundant conversions to bool
In-Reply-To: <CADnq5_NpMmo5SdXdStcRMGfcz0v6Nu-ZTORsSHo4_m_piAB77Q@mail.gmail.com>
References: <20231107082839.92061-1-jose.pekkarinen@foxhound.fi>
 <CADnq5_NpMmo5SdXdStcRMGfcz0v6Nu-ZTORsSHo4_m_piAB77Q@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <682272a58c1ddd564271d5828a06947c@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 23.137.251.61
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7981504442826991297
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddujedgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeekhfeguddufeegvdelgedtvdffgeehvddtkeevkeejvedvgeeitdefleehtdeitdenucfkphepuddvjedrtddrtddruddpvdefrddufeejrddvhedurdeiuddpudehuddrkedtrddvledrvddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigrdguvghvpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth

On 2023-11-07 17:39, Alex Deucher wrote:
> On Tue, Nov 7, 2023 at 4:44 AM José Pekkarinen
> <jose.pekkarinen@foxhound.fi> wrote:
>> 
>> This patch will address the following couple of warnings retrieved by
>> using coccinelle, where there is an explicit conversion to bool that
>> are redundant.
>> 
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c:94:102-107: 
>> WARNING: conversion to bool not needed here
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c:102:72-77: 
>> WARNING: conversion to bool not needed here
>> 
>> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
> 
> Thanks for the patch, but this was already fixed by Srinivasan a while 
> ago.

     My bad for not noticing, sorry!

     Thanks though!

     José.
