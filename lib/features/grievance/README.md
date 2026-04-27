# Grievance Redressal Feature ⚖️

## Purpose
The Grievance Redressal feature allows pilgrims to report issues (Sanitation, Medical, Overcharging, etc.) with automated geo-tagging and photo evidence. It ensures accountability through AI-driven department allocation and SLA tracking.

## Flow Explanation
1. **Selection**: User selects a category (e.g., Medical).
2. **Evidence**: User uploads photo evidence via Camera or Gallery. Geo-tagging is automatically captured.
3. **Details**: User provides a description of the issue.
4. **Submission**: Issue is submitted to the system.
5. **Workflow**:
   - `Pending`: Initial submission.
   - `Allocating`: AI allocates the issue to the relevant department (e.g., Health Dept).
   - `In Progress`: SLA timer starts.
   - `Action Taken`: Officials working on the resolution.
   - `Resolved`: Final resolution with feedback loop.

## Dependencies Used
- `permission_handler`: For Camera and Gallery permissions.
- `image_picker`: For capturing and selecting evidence photos.
- `riverpod`: For state management.
- `go_router`: For navigation.

## Offline Behavior
- Grievance categories and historical complaints are cached via Hive.
- New submissions require an internet connection for real-time tracking, but the UI provides a graceful experience even if the network is unstable.
